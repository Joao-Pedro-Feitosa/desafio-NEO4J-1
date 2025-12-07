MATCH (n) DETACH DELETE n;

CREATE (u1:Usuario {id: 'u1', nome: 'João'});
CREATE (u2:Usuario {id: 'u2', nome: 'Maria'});
CREATE (u3:Usuario {id: 'u3', nome: 'Carlos'});
CREATE (u4:Usuario {id: 'u4', nome: 'Ana'});

CREATE (m1:Musica {id: 'm1', titulo: 'Lose Yourself', genero: 'HipHop'});
CREATE (m2:Musica {id: 'm2', titulo: 'Blinding Lights', genero: 'Pop'});
CREATE (m3:Musica {id: 'm3', titulo: 'Smells Like Teen Spirit', genero: 'Rock'});
CREATE (m4:Musica {id: 'm4', titulo: 'HUMBLE.', genero: 'HipHop'});
CREATE (m5:Musica {id: 'm5', titulo: 'Shape of You', genero: 'Pop'});
CREATE (m6:Musica {id: 'm6', titulo: 'Bohemian Rhapsody', genero: 'Rock'});

CREATE (u1)-[:OUVIU]->(m1);
CREATE (u1)-[:OUVIU]->(m2);
CREATE (u2)-[:OUVIU]->(m2);
CREATE (u2)-[:OUVIU]->(m3);
CREATE (u3)-[:OUVIU]->(m1);
CREATE (u3)-[:OUVIU]->(m4);
CREATE (u4)-[:OUVIU]->(m3);
CREATE (u4)-[:OUVIU]->(m6);

MATCH (u:Usuario {id:'u1'})-[:OUVIU]->(m:Musica)<-[:OUVIU]-(outros:Usuario)
MATCH (outros)-[:OUVIU]->(rec:Musica)
WHERE NOT (u)-[:OUVIU]->(rec)
RETURN rec.titulo AS recomendacao, count(*) AS relevancia
ORDER BY relevancia DESC;

MATCH (u:Usuario {id:'u1'})-[:OUVIU]->(m:Musica)
WITH u, m.genero AS genero, count(*) AS total
ORDER BY total DESC
LIMIT 1
MATCH (rec:Musica {genero: genero})
WHERE NOT (u)-[:OUVIU]->(rec)
RETURN rec.titulo AS recomendacao_por_genero;

MATCH (n) RETURN n;
