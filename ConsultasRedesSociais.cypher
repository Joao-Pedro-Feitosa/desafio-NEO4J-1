MATCH (n) DETACH DELETE n;

CREATE (u1:Usuario {id:'u1', nome:'João'});
CREATE (u2:Usuario {id:'u2', nome:'Maria'});
CREATE (u3:Usuario {id:'u3', nome:'Carlos'});
CREATE (u4:Usuario {id:'u4', nome:'Ana'});
CREATE (u5:Usuario {id:'u5', nome:'Pedro'});

CREATE (p1:Post {id:'p1', conteudo:'Post sobre tecnologia'});
CREATE (p2:Post {id:'p2', conteudo:'Post sobre música'});
CREATE (p3:Post {id:'p3', conteudo:'Post sobre esportes'});

CREATE (u1)-[:SEGUE]->(u2);
CREATE (u2)-[:SEGUE]->(u3);
CREATE (u3)-[:SEGUE]->(u4);
CREATE (u4)-[:SEGUE]->(u1);
CREATE (u5)-[:SEGUE]->(u1);
CREATE (u5)-[:SEGUE]->(u2);

CREATE (u1)-[:CURTIU]->(p1);
CREATE (u2)-[:CURTIU]->(p1);
CREATE (u2)-[:CURTIU]->(p2);
CREATE (u3)-[:CURTIU]->(p2);
CREATE (u4)-[:CURTIU]->(p3);
CREATE (u5)-[:CURTIU]->(p2);

CREATE (u1)-[:COMENTOU {texto:'Muito bom'}]->(p1);
CREATE (u2)-[:COMENTOU {texto:'Concordo'}]->(p1);
CREATE (u3)-[:COMENTOU {texto:'Interessante'}]->(p2);

CREATE (u1)-[:PUBLICOU]->(p1);
CREATE (u2)-[:PUBLICOU]->(p2);
CREATE (u3)-[:PUBLICOU]->(p3);

MATCH (u:Usuario)-[:SEGUE]->(seguido:Usuario)
RETURN u.nome AS usuario, count(seguido) AS total_seguidos
ORDER BY total_seguidos DESC;

MATCH (u:Usuario)-[:CURTIU]->(p:Post)
RETURN p.conteudo AS post, count(u) AS total_curtidas
ORDER BY total_curtidas DESC;

MATCH (u1:Usuario)-[:SEGUE]->(u2:Usuario)-[:SEGUE]->(u3:Usuario)
WHERE NOT (u1)-[:SEGUE]->(u3)
RETURN u1.nome AS usuario, u3.nome AS sugestao;

MATCH (u:Usuario)-[:COMENTOU]->(p:Post)
RETURN p.conteudo AS post, count(u) AS total_comentarios
ORDER BY total_comentarios DESC;

MATCH (u:Usuario {id:'u1'})-[:SEGUE]->(seguido:Usuario)-[:SEGUE]->(amigo:Usuario)
WHERE NOT (u)-[:SEGUE]->(amigo) AND u <> amigo
RETURN amigo.nome AS recomendacao;
