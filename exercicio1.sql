create table area(
    ID_area number constraint pk_area primary key,
    nome varchar2(40) constraint nomeArea_area not null
);
create table curso(
    ID_curso number constraint pk_curso primary key,
    nome varchar2(40) constraint nomeCurso_curso not null,
    semestre varchar2(40) constraint semestreCurso_curso not null,
    turno varchar2(40) constraint turnoCurso_curso not null
);

create table disciplina(
    ID_disciplina number constraint pk_disciplina primary key,
    codigo number constraint codigoDisciplina_disciplina not null,
    nome varchar2(40) constraint nomeDisciplina_disciplina not null,
    creditos varchar2(40) constraint creditosDisciplina_disciplina not null
);

create table aluno(
    ID_aluno number constraint pk_aluno primary key,
    nome varchar2(40) constraint nomeAluno_aluno not null,
    data varchar2(40) constraint dataAluno_aluno not null
);

create table professor(
    ID_professor number constraint pk_professor primary key,
    nome varchar2(40) constraint nomeProfessor_professor not null,
    horas varchar2(40) constraint horasProfessor_professor not null
);

create table turma(
    iD_turma number constraint pk_turma primary key,
    semestre varchar2(40) constraint semestreTurma_turma not null,
    turno varchar2(40) constraint turnoTurma_turma not null,
    maximo varchar2(40) constraint maximoaluno_turma not null
);
create table turmaAluno(
    ID_turma number,
    ID_aluno number,
    mediafinal number constraint mediafinal_turma not null,
    constraint pk_turmaAluno primary key (id_aluno, id_turma)
);

create table alunoCurso(
    ID_aluno number,
    ID_curso number,
    data number constraint datainicial_aluno not null,
    constraint pk_alunoCurso primary key (id_aluno, id_curso)
);

alter table curso add
    (constraint fk_cArea_ID_area foreign key (ID_curso) references area(ID_area));
alter table disciplina add
    (constraint fk_Curso_ID_curso foreign key (ID_disciplina)references curso(ID_curso));
alter table professor add
    (constraint fk_pArea_ID_area foreign key (ID_professor) references area(ID_area));
alter table turma add
    (constraint fk_Disciplina_ID_disciplina foreign key (ID_turma) references disciplina(ID_disciplina),
    constraint fk_Professor_ID_professor foreign key (ID_turma) references professor(ID_professor));


create sequence a_area
increment by 1
start with 1
maxvalue 10
order
nocache;

create sequence b_curso
increment by 1
start with 20
maxvalue 29
order
nocache;

create sequence c_disciplina
increment by 1
start with 300
maxvalue 399
order
nocache;

create sequence d_aluno
increment by 1
start with 4000
maxvalue 4999
order
nocache;

create sequence e_professor
increment by 1
start with 50000
maxvalue 59999
order
nocache;

create sequence f_turma
increment by 1
start with 600000
maxvalue 699999
order
nocache;

insert into area(ID_area, nome) VALUES ('1','Matematica');
insert into area(ID_area, nome) VALUES ('2','Informatica');
insert into area(ID_area, nome) VALUES ('3','Saude');

insert into curso(ID_curso, nome, semestre, turno) VALUES ('20', 'Matematica','2º','manha');
insert into curso(ID_curso, nome, semestre, turno) VALUES ('21', 'Engenharia de Software','4º','tarde');
insert into curso(ID_curso, nome, semestre, turno) VALUES ('22', 'Enfermagem','7º','noite');

insert into disciplina(id_disciplina, codigo, nome, creditos) VALUES ('300','5','Algoritmo','10 cr');
insert into disciplina(id_disciplina, codigo, nome, creditos) VALUES ('301','1','Estrutura de Dados','20 cr');
insert into disciplina(id_disciplina, codigo, nome, creditos) VALUES ('302','8','Anatomia','15 cr');

insert into aluno(id_aluno, nome, data) VALUES ('4000','Enzo','07/04/01');
insert into aluno(id_aluno, nome, data) VALUES ('4001','Lucas','10/12/99');
insert into aluno(id_aluno, nome, data) VALUES ('4002','Carol','23/03/96');

insert into professor(id_professor, nome, horas) values ('50000','Luis Soares','66h');
insert into professor(id_professor, nome, horas) values ('50001','Paula Vencato','33h');
insert into professor(id_professor, nome, horas) values ('50002','Cesar Castro','120h');

insert into turma(iD_turma, semestre, turno, maximo) VALUES ('600000','3º','manha','30 alunos');
insert into turma(iD_turma, semestre, turno, maximo) VALUES ('600001','3º','noite','15 alunos');
insert into turma(iD_turma, semestre, turno, maximo) VALUES ('600002','3º','manha','45 alunos');

drop table area cascade constraints ;
drop table curso cascade constraints ;
drop table disciplina cascade constraints ;
drop table aluno cascade constraints ;
drop table professor cascade constraints ;
drop table turma cascade constraints ;
drop table turmaAluno cascade constraints ;
drop table alunoCurso cascade constraints ;

drop sequence a_area;
drop sequence b_curso;
drop sequence c_disciplina;
drop sequence d_aluno;
drop sequence e_professor;
drop sequence f_turma;
