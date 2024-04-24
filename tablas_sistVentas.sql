CREATE TABLE categorias (
    idCat INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50)
);

CREATE TABLE producto (
    idProd INT AUTO_INCREMENT PRIMARY KEY,
    nombreProd VARCHAR(50),
    idCat INT,
    FOREIGN KEY (idCat) REFERENCES categorias(idCat)
);

CREATE TABLE itemsSales (
    idItemsSales INT AUTO_INCREMENT PRIMARY KEY,
    idProd INT,
    FOREIGN KEY (idProd) REFERENCES producto(idProd),
    idVenta INT,
    cantidad INT NOT NULL,
    precioUnidad DECIMAL(10,2)
    );


CREATE TABLE rubro (
    idRubro INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR (50),
    idRubro INT,
    FOREIGN KEY (idRubro) REFERENCES rubro(idRubro),
    razonSocial VARCHAR(50)
);

CREATE TABLE empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR (50),
    fechaIngreso DATE,
    cuil INT(11)
);

CREATE TABLE vendedor (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    idEmpleado INT,
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);

CREATE TABLE ubicacion (
    idUbi INT AUTO_INCREMENT PRIMARY KEY,
    tienda VARCHAR(50),
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    pais VARCHAR (50),
    codigoPostal VARCHAR(20),
    calle VARCHAR (50),
    altura VARCHAR(10)
);

CREATE TABLE tiempo (
    idTiempo INT AUTO_INCREMENT PRIMARY KEY,
    fecha INT,
    mes INT,
    trimestre INT,
    anio INT,
    diaSemana INT,
    festivo TINYINT(1)
);

CREATE TABLE factSales (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    idTiempo INT,
    FOREIGN KEY (idTiempo) REFERENCES tiempo(idTiempo),
    idUbi INT,
    FOREIGN KEY (idUbi) REFERENCES ubicacion(idUbi),
    idVendedor INT,
    FOREIGN KEY (idVendedor) REFERENCES vendedor(idVendedor),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);