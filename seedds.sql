INSERT INTO `condicionesventas` (`id`, `condicionesventa`, `created_at`, `updated_at`) VALUES
(1, 'Contado', '2013-12-09 16:28:22', '2013-12-09 16:28:22'),
(2, 'CtaCte 30 dias', '2013-12-14 16:18:02', '2013-12-14 16:18:02');


INSERT INTO `tiposdocumentos` (`id`, `tiposdocumento`, `numero_documento`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'Factura A', 100000001, 'venta', '2013-12-09 16:12:41', '2013-12-09 16:15:12'),
(2, 'Factura B', 100000010, 'venta', '2013-12-09 16:15:28', '2013-12-22 16:41:04'),
(3, 'Factura C', 100000001, 'venta', '2013-12-21 03:00:00', '2013-12-21 03:00:00'),
(4, 'Factura M', 100000001, 'venta', '2013-12-21 03:00:00', '2013-12-21 03:00:00'),
(5, 'Recibo', 100000003, 'venta', '2013-12-21 03:00:00', '2013-12-22 14:52:15'),
(6, 'Nota Credito A', 100000001, 'venta', '2013-12-21 03:00:00', '2013-12-21 03:00:00'),
(7, 'Nota Debito A', 100000001, 'venta', '2013-12-21 03:00:00', '2013-12-21 03:00:00'),
(8, 'Remito', 100000001, 'venta', '2013-12-21 03:00:00', '2013-12-21 03:00:00'),
(9, 'Nota Credito B', 100000002, 'venta', '2013-12-21 03:00:00', '2013-12-22 14:52:15'),
(10, 'Nota Debito B', 100000001, 'venta', '2013-12-21 03:00:00', '2013-12-21 03:00:00');



INSERT INTO `responsabilidadesivas` (`id`, `responsabilidadesiva`, `updated_at`, `venta_tiposdocumentos_id`, `recibo_tiposdocumentos_id`, `nc_tiposdocumentos_id`, `nd_tiposdocumentos_id`, `created_at`) VALUES
(1, 'Responsable Inscripto', '2013-12-22 14:31:17', 1, 5, 6, 7, '2013-12-11 04:18:30'),
(2, 'Responsable no inscripto', '2013-12-22 14:32:42', 2, 5, 9, 10, '2013-12-11 04:18:42'),
(3, 'Monotributista', '2013-12-22 14:32:06', 2, 5, 9, 10, '2013-12-11 04:18:51'),
(4, 'Consumidor Final', '2013-12-22 14:32:23', 2, 5, 9, 10, '2013-12-11 04:19:00'),
(6, 'Excento', '2013-12-22 14:32:58', 2, 5, 9, 10, '2013-12-11 04:19:19');


INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'keloxers', 'keloxers@gmail.com', '$2y$08$sWI4duX437AmqM1Mr8d.CunsAtDOHa/R8uUofJv4xytA3dWzg6UOa', '2013-12-16 17:13:00', '2013-12-16 17:13:00'),
(2, 'victor', 'victor', '$2y$08$f0khwPAWrOk5r7I7i52FWuOU0ZrPRH6IzM8sQD2ZqehEtqk1hY3.G', '2013-12-21 15:09:15', '2013-12-21 15:09:15');


INSERT INTO `condicionesventas` (`id`, `condicionesventa`, `created_at`, `updated_at`) VALUES
(1, 'Contado', '2013-12-09 16:28:22', '2013-12-09 16:28:22'),
(2, 'CtaCte 30 dias', '2013-12-14 16:18:02', '2013-12-14 16:18:02');


INSERT INTO `provincias` (`id`, `provincia`, `created_at`, `updated_at`) VALUES
(2, 'Corrientes', '2013-12-09 15:59:23', '2013-12-09 15:59:23'),
(3, 'Entre Rios', '2013-12-10 01:10:51', '2013-12-10 01:10:51'),
(4, 'Salta', '2013-12-10 01:10:57', '2013-12-10 01:10:57'),
(6, 'Neuquén', '2013-12-10 01:11:18', '2013-12-14 16:47:53');



INSERT INTO `ciudads` (`id`, `ciudad`, `created_at`, `updated_at`, `provincias_id`) VALUES
(1, 'Virasoro', '2013-12-09 16:46:07', '2013-12-09 16:46:07', 2),
(2, 'Santo Tome', '2013-12-09 16:46:20', '2013-12-09 17:01:38', 2),
(10, 'Concordia', '2013-12-10 16:45:46', '2013-12-10 16:45:46', 3),
(11, 'Ituzaingo', '2013-12-11 01:02:50', '2013-12-11 01:02:50', 2);
