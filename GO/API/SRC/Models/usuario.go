/*
RESUMO DIDÁTICO: Estruturas de Dados (Structs) e Tags JSON em Go

Este arquivo define o modelo (Model) de dados do 'Usuario', mapeando como as informações 
de uma conta serão representadas na memória do backend e como serão convertidas para JSON.

O código ilustra:
1. Representação do Domínio (Struct): Consolida em um único tipo estruturado os campos 
   essenciais que caracterizam um usuário no sistema (ID, Nome, Nick, E-mail, Senha e Data de Criação).
2. Integração com Banco e JSON (Tipagem): O campo 'ID' usa 'uint64' para suportar números 
   inteiros grandes e positivos. O campo 'CriadoEm' usa o tipo nativo 'time.Time' para 
   manipular datas e fusos horários corretamente.
3. Tags de Metadados (`json:"..."`): Instruções interpretadas pelos pacotes de JSON do Go. 
   Elas definem que, quando a struct for enviada para o frontend ou recebida em uma API, 
   as chaves do JSON usarão letras minúsculas (ex: "nome", "email"), mantendo o padrão da web.
4. Omissão de Campos Vazios (`omitempty`): Uma configuração opcional muito importante. Se um 
   campo estiver com o seu valor padrão/zerado (ex: string vazia ou ID igual a 0), o Go remove 
   completamente essa chave do JSON gerado, economizando tráfego de dados e omitindo dados sensíveis 
   (como a 'senha') quando não forem necessários.
*/
package models

import "time"

type Usuarios struct {
	// Oid,omitempty garante que o ID não apareça no JSON se ele for zero (ex: na hora de criar)
	ID       uint64    `json:"id,omitempty"`
	Nome     string    `json:"nome,omitempty"`
	Nick     string    `json:"nick,omitempty"`
	Email    string    `json:"email,omitempty"`
	Senha    string    `json:"senha,omitempty"`
	CriadoEm time.Time `json:"CriadoEm,omitempty"`
}