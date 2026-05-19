/*
RESUMO DIDÁTICO:
Este script demonstra o uso de 'interfaces', que funcionam como contratos de
comportamento para os tipos em Go.

O código ilustra:
1. Definição de Interface: A interface 'forma' estabelece que qualquer tipo
   que possua o método 'area() float64' pode ser considerado uma 'forma'.
2. Implementação Implícita: Em Go, você não usa uma palavra-chave como 'implements'.
   Se uma struct possui os métodos exigidos pela interface, ela a implementa automaticamente.
3. Polimorfismo: A função 'escreverarea' aceita qualquer objeto que respeite
   o contrato 'forma', seja ele um 'retangulo' ou um 'circulo'.
4. Flexibilidade: Permite criar funções genéricas que focam no que o objeto
   FAZ (comportamento) e não no que o objeto É (tipo).
*/

package main

import (
	"fmt"
	"math"
)

// 1. O Contrato: Quem quiser ser uma 'forma' deve saber calcular sua 'area'
type forma interface {
	area() float64
}

// 2. Função Polimórfica: Aceita qualquer coisa que assine o contrato 'forma'
func escreverarea(f forma) {
	fmt.Printf("A area da forma é %0.2f \n", f.area())
}

type retangulo struct {
	altura  float64
	largura float64
}

// Implementação para retangulo
func (r retangulo) area() float64 {
	return r.altura * r.largura
}

type circulo struct {
	raio float64
}

// Implementação para circulo
func (c circulo) area() float64 {
	return math.Pi * math.Pow(c.raio, 2)
}

func main() {
	// Retângulo é passado como 'forma'
	r := retangulo{10, 15}
	escreverarea(r)

	// Círculo também é passado como 'forma'
	c := circulo{10}
	escreverarea(c)
}
