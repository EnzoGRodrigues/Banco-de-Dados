create table area(
    ID_area number constraint pk_area primary key,
    nome varchar2(40) not null
);
create table curso(
    ID_curso number constraint pk_curso primary key,
    nome varchar2(40) not null,
    semestre varchar2(40) not null,
    turno varchar2(40) not null,
    ID_area number
);

create table disciplina(
    ID_disciplina number constraint pk_disciplina primary key,
    codigo varchar2(40) not null,
    nome varchar2(40) not null,
    creditos number not null,
    ID_curso number
);

create table aluno(
    ID_aluno number constraint pk_aluno primary key,
    nome varchar2(40) not null,
    data_nasc date not null
);

create table professor(
    ID_professor number constraint pk_professor primary key,
    nome varchar2(40)  not null,
    horas number not null,
    ID_area number not null
);

create table turma(
    iD_turma number constraint pk_turma primary key,
    semestre varchar2(40) not null,
    turno varchar2(40) not null,
    maximo number(3) not null,
    ID_disciplina number  not null,
    ID_professor number not null
);

create table turmaAluno(
    ID_turma number,
    ID_aluno number,
    mediafinal number not null,
    constraint pk_turmaAluno primary key (id_aluno, id_turma)
);

create table alunoCurso(
    ID_aluno number,
    ID_curso number,
    data_inicio date  not null,
    data_fim date not null,
    turno varchar2(40),
    constraint pk_alunoCurso primary key (id_aluno, id_curso)
);

alter table curso add
    (constraint fk_curso_area foreign key (ID_area) references area(ID_area));
alter table disciplina add
    (constraint fk_disc_curso foreign key (ID_curso)references curso(ID_curso));
alter table professor add
    (constraint fk_prof_area foreign key (ID_area) references area(ID_area));
alter table turma add
    (constraint fk_turma_ID_disciplina foreign key (ID_disciplina) references disciplina(ID_disciplina),
    constraint fk_turmaprof_professor foreign key (ID_professor) references professor(ID_professor));
alter table turmaAluno add
    (constraint fk_turmAluno_turma foreign key (ID_turma) references turma(ID_turma),
    constraint fk_Turmaluno2_aluno foreign key (ID_aluno)references aluno(ID_aluno));
alter table alunoCurso add
    (constraint fk_alunocurso_aluno foreign key (ID_aluno)references aluno(ID_aluno),
    constraint fk_Alunocurso2_curso foreign key (ID_curso)references curso(ID_curso));

create sequence b_curso
increment by 1
start with 20
maxvalue 29
order
nocache;

create sequence c_disciplina
increment by 1
start with 30
maxvalue 39
order
nocache;

create sequence d_aluno
increment by 1
start with 40
maxvalue 49
order
nocache;

create sequence e_professor
increment by 1
start with 50
maxvalue 59
order
nocache;

create sequence f_turma
increment by 1
start with 60
maxvalue 69
order
nocache;

--area--
insert into area(ID_area, nome) VALUES ('1','Matematica');
insert into area(ID_area, nome) VALUES ('2','Informatica');
insert into area(ID_area, nome) VALUES ('3','Saude');
--curso--
insert into curso(ID_CURSO,ID_area, nome, semestre, turno) VALUES (b_curso.nextval,'1','Matematica','2º','manha');
insert into curso(ID_curso,ID_area, nome, semestre, turno) VALUES (b_curso.nextval,'2','Engenharia de Software','4º','tarde');
insert into curso(ID_curso,ID_area, nome, semestre, turno) VALUES (b_curso.nextval,'3','Enfermagem','7º','noite');
--disciplina--
insert into disciplina(id_disciplina,ID_curso, codigo, nome, creditos) VALUES (c_disciplina.nextval,b_curso.nextval,'5','Algoritmo','10');
insert into disciplina(id_disciplina,ID_curso, codigo, nome, creditos) VALUES (c_disciplina.nextval,b_curso.nextval,'1','Estrutura de Dados','20');
insert into disciplina(id_disciplina,ID_curso, codigo, nome, creditos) VALUES (c_disciplina.nextval,b_curso.nextval,'8','Anatomia','15');
--aluno--
insert into aluno(id_aluno, nome, data_nasc) VALUES (d_aluno.nextval,'Enzo','07/04/2001');
insert into aluno(id_aluno, nome, data_nasc) VALUES (d_aluno.nextval,'Lucas','10/12/1999');
insert into aluno(id_aluno, nome, data_nasc) VALUES (d_aluno.nextval,'Carol','23/03/1996');
--professor--
insert into professor(id_professor,ID_area, nome, horas) values (e_professor.nextval,'1','Luis Soares','66h');
insert into professor(id_professor,ID_area, nome, horas) values (e_professor.nextval,'2','Paula Vencato','33h');
insert into professor(id_professor,ID_area, nome, horas) values (e_professor.nextval,'3','Cesar Castro','120h');
--turma--
insert into turma(iD_turma,ID_professor,ID_disciplina, semestre, turno, maximo) VALUES (f_turma.nextval,e_professor.nextval,c_disciplina.nextval,'3º','manha','30 alunos');
insert into turma(iD_turma,ID_professor,ID_disciplina, semestre, turno, maximo) VALUES (f_turma.nextval,e_professor.nextval,c_disciplina.nextval,'3º','noite','15 alunos');
insert into turma(iD_turma,ID_professor,ID_disciplina, semestre, turno, maximo) VALUES (f_turma.nextval,e_professor.nextval,c_disciplina.nextval,'3º','manha','45 alunos');
--turmaAluno--
insert into turmaAluno(ID_turma, ID_aluno, mediafinal) VALUES ('600001','4001','8');
insert into  turmaAluno(ID_turma, ID_aluno, mediafinal) VALUES ('600002','4002','10');
insert into turmaAluno(ID_turma, ID_aluno, mediafinal) VALUES ('600003','4003','7');
--alunoCurso--
insert into alunoCurso(ID_aluno, ID_curso, data_inicio,data_fim) VALUES ('4001','20','08/04/2021','10/05/2022');
insert into alunoCurso(ID_aluno, ID_curso, data_inicio,data_fim) VALUES ('4002','21','10/03/2021','02/03/2022');
insert into alunoCurso(ID_aluno, ID_curso, data_inicio,data_fim) VALUES ('4003','22','25/01/2021','30/12/2022');




drop table area cascade constraints ;
drop table curso cascade constraints ;
drop table disciplina cascade constraints ;
drop table aluno cascade constraints ;
drop table professor cascade constraints ;
drop table turma cascade constraints ;
drop table turmaAluno cascade constraints ;
drop table alunoCurso cascade constraints ;

drop sequence b_curso;
drop sequence c_disciplina;
drop sequence d_aluno;
drop sequence e_professor;
drop sequence f_turma;
