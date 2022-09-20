pragma solidity ^0.8.7.0;
// SPDX-License-Identifier: MIT

// sözleşmemiz
contract TodoList{

// yapımız
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    // todolist yeni madde oluşturma fonksiyonu
    function create(string calldata _text) external {
        // gas fee tasarrufu için calldata kullanıyoruz.
        // ekleme işlemi tek satırda olacak.
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // todolist günceleme fonksiyonu
    function updateText(uint _index, string calldata _text) external {
        // Burada yine gas tasarrufu var.
        // 1. yöntem
        // güncllenecek alan bir tane ise gas fe daha uygun
        todos[_index].text = _text;

        // 2. yönten
        // birden çok güncelenecek alan varsa bu yöntem kullanılabilir.
        // ancak fazla gas fee alır.
        // Todo storage todo = [todosindex};
        // todo.text = _text;

    }

    // verileri alma konksiyonu
    function get(uint _index) external view returns (string memory, bool){
        // storage veya memory verilebilir. Ancak memory daha az fee harcar.
        Todo memory todo = todos[_index]; // daha az fee
        return (todo.text, todo.completed);
    }

    // tamamlananı değiştirecek fonksiyon
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }


}