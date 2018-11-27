#include "types.h"
#include "user.h"

float teste(int pid){
  int i, j=0, r = 1;

  for(i=1; i<=80000000;i++){
    r = (i+r) * (666 + j) +5 - 2;
    j++;
    if(j < 80000000) i=1;
    //i=1;
  }
  return r;
}

int main(){
  int numProc = 5;  //Definir numero de processos a serem alocados
  int i, pid, r;

  for(i=0;i<numProc;i++){

    if(i < 2){
      pid = fork(10);
      printf(1, "Processo %d tem 10 tickets\n", getpid());
    }
    else if(i < 3){
      pid = fork(200);
      printf(1, "Processo %d tem 200 tickets\n", getpid());
    }
    else{
      pid = fork(1000);
      printf(1, "Processo %d tem 1000 tickets\n", getpid());
    }
    
    if(pid <0) printf(1, "Falha ao forkar %d\n", getpid());
    else if(pid >0) continue;
    else {
      r = teste(getpid());
      printf(1, "\nTERMINOU %d - Resultado %d\n", getpid(), r);
      break;
    }
  }
  exit();
}
