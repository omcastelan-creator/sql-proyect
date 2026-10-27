--  crear tabla 
CREATE TABLE descuentos(
    id_descuento INT IDENTITY (1,1) PRIMARY KEY,
    codigo VARCHAR (50) NOT NULL,
    porcentaje DECIMAL (5,2),
    activo BIT DEFAULT 1 

)

-- inssertar datos 
INSERT INTO descuentos (codigo, porcentaje)
VALUES
('kin10', '10.00'),
('verano15', '15.00');

-- actualizar precios 
UPDATE producto
SET precio = precio + 10
WHERE linea = 'facial';

-- desactivar cupón 
UPDATE descuentos
SET activo = '0'
WHERE codigo = 'kin10'
---subir archico 