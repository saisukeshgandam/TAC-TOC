(function(){
  const cells = document.querySelectorAll('.cell');
  const statusEl = document.getElementById('status');
  const resetBtn = document.getElementById('reset');
  let board = Array(9).fill('');
  let turn = 'X';
  let running = true;

  const winLines = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ];

  function render(){
    board.forEach((v,i)=>{
      cells[i].textContent = v;
      cells[i].classList.toggle('x', v==='X');
      cells[i].classList.toggle('o', v==='O');
    });
  }

  function checkWin(){
    for(const line of winLines){
      const [a,b,c] = line;
      if(board[a] && board[a] === board[b] && board[a] === board[c]){
        running = false;
        statusEl.textContent = board[a] + ' wins!';
        return;
      }
    }
    if(board.every(Boolean)){
      running = false;
      statusEl.textContent = 'Draw!';
      return;
    }
    statusEl.textContent = turn + "'s turn";
  }

  function onCellClick(e){
    if(!running) return;
    const i = Number(e.currentTarget.dataset.index);
    if(board[i]) return;
    board[i] = turn;
    turn = turn === 'X' ? 'O' : 'X';
    render();
    checkWin();
  }

  function reset(){
    board = Array(9).fill('');
    turn = 'X';
    running = true;
    statusEl.textContent = 'X goes first';
    render();
  }

  cells.forEach(c=>c.addEventListener('click', onCellClick));
  resetBtn.addEventListener('click', reset);
  render();
  checkWin();
})();
