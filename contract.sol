// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Storage {

    // string nom;
    // string usua;
    // string senh;
    
    //string[3] pessoa ; // nome, login, senha, 
    uint nota; //cpf, pontos
    //uint votos;
 
    mapping (address => uint) nota_base;
    mapping (address => uint) votos_base;

    function updateNota() public {
        nota_base[msg.sender] = (nota_base[msg.sender] * votos_base[msg.sender])/(votos_base[msg.sender] + 1);
        votos_base[msg.sender] = votos_base[msg.sender] + 1;
   }

    function store(uint _nota) public {
        nota_base[msg.sender] = ((nota_base[msg.sender] * votos_base[msg.sender]) + _nota)/(votos_base[msg.sender] + 1);
        votos_base[msg.sender] = votos_base[msg.sender] + 1;
    }
  
    function retrieve1() public view returns (uint){
        return nota_base[msg.sender] ;
    }
    function retrieve2() public view returns (uint){
        return votos_base[msg.sender] ;
    }
    
}
