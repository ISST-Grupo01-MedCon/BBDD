CREATE TABLE Medico(
    numeroColegiado INTEGER NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    especialidad VARCHAR(255) NOT NULL,
    salaConsultaId INTEGER NOT NULL,
    salaEsperaId INTEGER NOT NULL,
    PRIMARY KEY (numeroColegiado),
    FOREIGN KEY (salaConsultaId) REFERENCES SalaConsulta(id),
    FOREIGN KEY (salaEsperaId) REFERENCES SalaEspera(id)
);
CREATE TABLE Consulta(
    id INTEGER NOT NULL UNIQUE,
    fecha INTEGER NOT NULL,
    especialidad VARCHAR(255) NOT NULL,
    medicoId INTEGER NOT NULL,
    salaConsultaId INTEGER NOT NULL,
    salaEsperaId INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (salaConsultaId) REFERENCES SalaConsulta(id),
    FOREIGN KEY (salaEsperaId) REFERENCES SalaEspera(id),
    FOREIGN KEY (medicoId) REFERENCES Medico(numeroColegiado)
);
CREATE TABLE Paciente(
    dni INTEGER NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    cipa INTEGER NOT NULL UNIQUE,
    consultaId INTEGER NOT NULL,
    ticketId INTEGER NOT NULL UNIQUE,
    PRIMARY KEY (dni),
    FOREIGN KEY (consultaId) REFERENCES Consulta(id),
    FOREIGN KEY (ticketId) REFERENCES Ticket(id)
);
CREATE TABLE Ticket(
    id INTEGER NOT NULL UNIQUE,
    numeroEspera INTEGER NOT NULL,
    turnoEspera VARCHAR(3) NOT NULL UNIQUE,
    fechaConsulta VARCHAR(18) NOT NULL,
    salaEsperaId INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (salaEsperaId) REFERENCES SalaEspera(id) 
);
CREATE TABLE SalaConsulta(
    id INTEGER NOT NULL UNIQUE,
    numero INTEGER NOT NULL UNIQUE,
    salaEsperaId INTEGER NOT NULL,
    consultaId INTEGER NOT NULL UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (salaEsperaId) REFERENCES SalaEspera(id),
    FOREIGN KEY (consultaId) REFERENCES Consulta(id)
);
CREATE TABLE SalaEspera(
    id INTEGER NOT NULL UNIQUE,
    nombre VARCHAR (255) NOT NULL,
    PRIMARY KEY (id)
)
INSERT OR REPLACE INTO SalaEspera(id,nombre) VALUES(1, 'Traumatologia');
INSERT OR REPLACE INTO SalaEspera(id,nombre) VALUES(2, 'Pediatria');
INSERT OR REPLACE INTO SalaEspera(id,nombre) VALUES(3, 'Medicina General');

INSERT OR REPLACE INTO SalaConsulta(id, numero, salaEsperaId, consultaId) VALUES(1, 101, 1, 1);
INSERT OR REPLACE INTO SalaConsulta(id, numero, salaEsperaId, consultaId) VALUES(2, 203, 2, 2);
INSERT OR REPLACE INTO SalaConsulta(id, numero, salaEsperaId, consultaId) VALUES(3, 304, 3, 3);

INSERT OR REPLACE INTO Ticket(id, numeroEspera, turnoEspera, salaEsperaId, fechaConsulta) VALUES(1, 1, 'AB5', 1, '08/04/2022 08:00');
INSERT OR REPLACE INTO Ticket(id, numeroEspera, turnoEspera, salaEsperaId, fechaConsulta) VALUES(2, 2, 'PY9', 2, '08/04/2022 08:30');
INSERT OR REPLACE INTO Ticket(id, numeroEspera, turnoEspera, salaEsperaId, fechaConsulta) VALUES(3, 3, 'LR2', 3, '08/04/2022 09:00');

INSERT OR REPLACE INTO Medico(numeroColegiado, nombre, especialidad, salaConsultaId, salaEsperaId) VALUES(280156735, 'Manuel Montoya Rodriguez', 'Pediatria', 2, 2);
INSERT OR REPLACE INTO Medico(numeroColegiado, nombre, especialidad, salaConsultaId, salaEsperaId) VALUES(983746581, 'Patricia Flores Garcia', 'Traumatologia', 1, 1);
INSERT OR REPLACE INTO Medico(numeroColegiado, nombre, especialidad, salaConsultaId, salaEsperaId) VALUES(364819273, 'Gador Marquez de Linares', 'Medicina General', 3, 3);

INSERT OR REPLACE INTO Consulta(id, fecha, especialidad, medicoId, salaConsultaId, salaEsperaId) VALUES(1, 080420220800, 'Traumatologia', 983746581, 1, 1);
INSERT OR REPLACE INTO Consulta(id, fecha, especialidad, medicoId, salaConsultaId, salaEsperaId) VALUES(2, 080420220830, 'Pediatria', 280156735, 2, 2);
INSERT OR REPLACE INTO Consulta(id, fecha, especialidad, medicoId, salaConsultaId, salaEsperaId) VALUES(3, 080420220900, 'Medicina General', 364819273, 3, 3);

INSERT OR REPLACE INTO Paciente(dni, nombre, cipa, consultaId, ticketId) VALUES(56785934, 'Alvaro Gonzalez Marquez', 9182837492, 1, 1);
INSERT OR REPLACE INTO Paciente(dni, nombre, cipa, consultaId, ticketId) VALUES(93847561, 'Manuela Garcia Garcia', 4829138291, 2, 2);
INSERT OR REPLACE INTO Paciente(dni, nombre, cipa, consultaId, ticketId) VALUES(83910238, 'Gonzalo Lopez Martinez', 9283485912, 3, 3);