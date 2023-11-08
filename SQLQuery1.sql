go
use DbPrueba

go

create table Proveedores(
IdProveedor int primary key,
NombreProve varchar(50),
DireccionP varchar(50),
TelefonoP varchar(15)
)

ALTER TABLE Pedidos
ADD IdProveedor INT,
       

INSERT INTO Proveedores (IdProveedor, NombreProve, DireccionP, TelefonoP) VALUES
(1, 'Proveedor1', 'Dirección 1', '123-456-7890'),
(2, 'Proveedor2', 'Dirección 2', '987-654-3210');


Update Pedidos
set	IdProveedor = 2
where IdPedidio = 1;

select * from Pedidos

Select C.Nombre As Nombre, P.IdPedidio, PR.NombreProve As NombreProve
From Clientes C
Join Pedidos P on C.IdCliente = P.IdCliente
Join Proveedores PR on P.Idproveedor = PR.IdProveedor;