SELECT  a.id                                                                     
       ,a.nome                                                                   
       ,a.cpf                                                                    
       ,d.descricao                                                              
       ,da.nota_periodo_1  as n1                                                      
       ,da.nota_periodo_2  as n2                                                      
       ,da.nota_trabalho   as n3                                                     
       ,((da.nota_periodo_1 + da.nota_periodo_2 + da.nota_trabalho ) /3) as Media  
  FROM aluno a                                                                   
  LEFT JOIN disciplina_aluno da                                                  
    ON a.id = da.codigo_aluno                                                    
  LEFT JOIN disciplinas d                                                        
    ON d.id = da.codigo_disciplina                                               
 WHERE 1 = 1                                                                     
 ORDER BY a.nome, d.descricao                                                     