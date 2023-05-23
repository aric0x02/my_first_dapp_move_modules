module Alice::TodoList {

//   use aptos_framework::account;
//   use std::signer;
//   use aptos_framework::event;
//   use std::string::String;
//  use Std::ASCII::String;
use Std::Event;
 use Std::Signer;
  use PontemFramework::Table;
// use Std::Vector;
//   #[test_only]
//   use std::string;

  // Errors
  const E_NOT_INITIALIZED: u64 = 1;
  const ETASK_DOESNT_EXIST: u64 = 2;
  const ETASK_IS_COMPLETED: u64 = 3;

  struct TodoList has key {
    tasks: Table::Table<u64, Task>,
    set_task_event: Event::EventHandle<Task>,
    task_counter: u64
  }

  struct Task has store, drop, copy {
    task_id: u64,
    address:address,
    content: vector<u8>,
    completed: bool,
  }

  public (script) fun create_list(account: signer){
    let todo_list = TodoList {
      tasks: Table::new(),
      set_task_event: Event::new_event_handle<Task>(&account),
      task_counter: 0
    };
    // move the TodoList resource under the signer account
    move_to(&account, todo_list);
  }

  public (script) fun create_task(account: signer, content: vector<u8>) acquires TodoList {
    // let content= Std::ASCII::string(content);
    // gets the signer address
    let signer_address = Signer::address_of(&account);
    // assert signer has created a list
    assert!(exists<TodoList>(signer_address), E_NOT_INITIALIZED);
    // gets the TodoList resource
    let todo_list = borrow_global_mut<TodoList>(signer_address);
    // increment task counter
    let counter = todo_list.task_counter + 1;
    // creates a new Task
    let new_task = Task {
      task_id: counter,
      address: signer_address,
      content,
      completed: false
    };
    // adds the new task into the tasks table
    Table::add(&mut todo_list.tasks, &counter, new_task);
    // sets the task counter to be the incremented counter
    todo_list.task_counter = counter;
    // fires a new task created event
    Event::emit_event(
      &mut borrow_global_mut<TodoList>(signer_address).set_task_event,
      new_task,
    );
  }

  public (script)  fun complete_task(account: signer, task_id: u64) acquires TodoList {
    // gets the signer address
    let signer_address = Signer::address_of(&account);
		// assert signer has created a list
    assert!(exists<TodoList>(signer_address), E_NOT_INITIALIZED);
    // gets the TodoList resource
    let todo_list = borrow_global_mut<TodoList>(signer_address);
    // assert task exists
    assert!(Table::contains(&todo_list.tasks, &task_id), ETASK_DOESNT_EXIST);
    // gets the task matched the task_id
    let task_record = Table::borrow_mut(&mut todo_list.tasks, &task_id);
    // assert task is not completed
    assert!(task_record.completed==false, ETASK_IS_COMPLETED);
    // update task as completed
    task_record.completed = true;
  }

  #[test(admin = @0x123)]
  public (script)  fun test_flow(admin: signer) acquires TodoList {
    // creates an admin @todolist_addr account for test
    account::create_account_for_test(Signer::address_of(&admin));
    // initialize contract with admin account
    create_list(&admin);

    // creates a task by the admin account
    create_task(&admin, string::utf8(b"New Task"));
    let task_count = event::counter(&borrow_global<TodoList>(Signer::address_of(&admin)).set_task_event);
    assert!(task_count == 1, 4);
    let todo_list = borrow_global<TodoList>(Signer::address_of(&admin));
    assert!(todo_list.task_counter == 1, 5);
    let task_record = Table::borrow(&todo_list.tasks, todo_list.task_counter);
    assert!(task_record.task_id == 1, 6);
    assert!(!task_record.completed, 7);
    assert!(task_record.content == string::utf8(b"New Task"), 8);
    assert!(task_record.address == Signer::address_of(&admin), 9);

    // updates task as completed
    complete_task(&admin, 1);
    let todo_list = borrow_global<TodoList>(Signer::address_of(&admin));
    let task_record = Table::borrow(&todo_list.tasks, 1);
    assert!(task_record.task_id == 1, 10);
    assert!(task_record.completed == true, 11);
    assert!(task_record.content == string::utf8(b"New Task"), 12);
    assert!(task_record.address == Signer::address_of(&admin), 13);
  }

  #[test(admin = @0x123)]
  #[expected_failure(abort_code = E_NOT_INITIALIZED)]
  public (script)  fun account_can_not_update_task(admin: signer) acquires TodoList {
    // creates an admin @todolist_addr account for test
    account::create_account_for_test(Signer::address_of(&admin));
    // account can not toggle task as no list was created
    complete_task(&admin, 2);
  }

}
