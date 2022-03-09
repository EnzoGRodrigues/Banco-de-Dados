create table area(
    id_area number constraint pk_area primary key,
    nome varchar2(20) constraint nomeArea_area not null
);
create table curso(
    id_curso number constraint pk_curso primary key,
    nome varchar2(20) constraint nomeCurso_curso not null,
    semestre number constraint semestreCurso_curso not null,
    turno varchar2(20) constraint turnoCurso_curso not null,
    id_area number constraint nArea_id_area not null
);

create table disciplina(
    id_disciplina number constraint pk_disciplina primary key,
    codigo number constraint codigoDisciplina_disciplina not null,
    nome varchar2(40) constraint nomeDisciplina_disciplina not null,
    creditos varchar2(40) constraint creditosDisciplina_disciplina not null,
    id_curso number constraint nCurso_id_curso not null
);

create table aluno(
    id_aluno number constraint pk_aluno primary key,
    nome varchar2(40) constraint nomeAluno_aluno not null,
    data varchar2(40) constraint dataAluno_aluno not null
);

create table professor(
    id_professor number constraint pk_professor primary key,
    nome varchar2(40) constraint nomeProfessor_professor not null,
    horas varchar2(40) constraint horasProfessor_professor not null,
    id_area number constraint nArea_id_area not null
);

create table turma(
    id_turma number constraint pk_turma primary key,
    semestre varchar2(40) constraint semestreTurma_turma not null,
    turno varchar2(40) constraint turnoTurma_turma not null,
    maximo varchar2(40) constraint maximoaluno_turma not null,
    id_disciplina number constraint nDisciplina_id_disciplina not null,
    id_professor number constraint nProfessor_id_professor not null
);
create table turmaAluno(
    id_turma number,
    id_aluno number,
    mediafinal number constraint mediafinal_turma not null,
    constraint pk_turmaAluno primary key (id_aluno, id_turma)
);

create table alunoCurso(
    id_aluno number,
    id_curso number,
    data number constraint datainicial_aluno not null,
    constraint pk_alunoCurso primary key (id_aluno, id_curso)
);



drop table area;
drop table curso;
drop table disciplina;
drop table aluno;
drop table professor;
drop table turma;
drop table turmaAluno;
drop table alunoCurso;
