CREATE (u1:Usuario {userId: 'u1', nome: 'João', email: 'joao@example.com', dataCadastro: date('2025-01-01')});
CREATE (u2:Usuario {userId: 'u2', nome: 'Maria', email: 'maria@example.com', dataCadastro: date('2025-02-02')});

CREATE (c1:Conteudo {contentId: 'c1', titulo: 'Filme A', tipo: 'Filme', duracao: 7200, ano: 2023});
CREATE (c2:Conteudo {contentId: 'c2', titulo: 'Série B - Ep1', tipo: 'Episodio', duracao: 3600, ano: 2024});

CREATE (g1:Genero {nome: 'Ficcao'});
CREATE (a1:Artista {artistaId: 'ar1', nome: 'Diretor X'});

CREATE (u1)-[:ASSISTIU {data: date('2025-12-01'), progressoSegundos: 7200, completo: true}]->(c1);
CREATE (u2)-[:ASSISTIU {data: date('2025-12-05'), progressoSegundos: 1800, completo: false}]->(c2);
CREATE (c1)-[:PERTENCE_A]->(g1);
CREATE (c1)-[:CRIADO_POR]->(a1);
