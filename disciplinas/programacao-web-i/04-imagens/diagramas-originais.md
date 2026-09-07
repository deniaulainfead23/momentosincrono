# Diagramas originais — Programação Web I

Os diagramas abaixo foram produzidos para este repositório e não são imagens extraídas de materiais externos.

## Separação de responsabilidades

```mermaid
flowchart LR
 A[HTML] --> D[Documento]
 B[CSS] --> D
 C[JavaScript] --> D
 D --> E[Interface web]
```

## Fluxo de interação

```mermaid
sequenceDiagram
 participant U as Usuário
 participant P as Página
 participant S as Script
 U->>P: Preenche formulário
 P->>S: Dispara evento
 S->>P: Atualiza interface
 P-->>U: Mostra feedback
```
