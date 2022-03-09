create table area(
    ID_area number constraint pk_area primary key,
    nome varchar2(20) constraint nomeArea_area not null
);
create table curso(
    ID_curso number constraint pk_curso primary key,
    nome varchar2(20) constraint nomeCurso_curso not null,
    semestre number constraint semestreCurso_curso not null,
    turno varchar2(20) constraint turnoCurso_curso not null,
    id_area number constraint nArea_id_area not null
);

create table disciplina(
    ID_disciplina number constraint pk_disciplina primary key,
    codigo number constraint codigoDisciplina_disciplina not null,
    nome varchar2(40) constraint nomeDisciplina_disciplina not null,
    creditos varchar2(40) constraint creditosDisciplina_disciplina not null,
    id_curso number constraint nCurso_id_curso not null
);

create table aluno(
    ID_aluno number constraint pk_aluno primary key,
    nome varchar2(40) constraint nomeAluno_aluno not null,
    data varchar2(40) constraint dataAluno_aluno not null
);

create table professor(
    ID_professor number constraint pk_professor primary key,
    nome varchar2(40) constraint nomeProfessor_professor not null,
    horas varchar2(40) constraint horasProfessor_professor not null,
    ID_area number constraint mArea_ID_area not null
);

create table turma(
    id_turma number constraint pk_turma primary key,
    semestre varchar2(40) constraint semestreTurma_turma not null,
    turno varchar2(40) constraint turnoTurma_turma not null,
    maximo varchar2(40) constraint maximoaluno_turma not null,
    ID_disciplina number constraint nDisciplina_id_disciplina not null,
    ID_professor number constraint nProfessor_id_professor not null
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
    (constraint fk_Area_ID_area foreign key (ID_area) references area(ID_area));
alter table disciplina add
    (constraint fk_Curso_ID_curso foreign key (id_curso)references curso(ID_curso));
alter table professor add
    (constraint fk_pArea_ID_area foreign key (ID_area) references area(ID_area));
alter table turma add
    (constraint fk_Disciplina_ID_disciplina foreign key (ID_disciplina) references disciplina(ID_disciplina),
    constraint fk_Professor_ID_professor foreign key (ID_professor) references professor(ID_professor));


drop table area;
drop table curso;
drop table disciplina;
drop table aluno;
drop table professor;
drop table turma;
drop table turmaAluno;
drop table alunoCurso;
