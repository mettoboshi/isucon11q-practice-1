CREATE TABLE `isu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jia_isu_uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` longblob DEFAULT NULL,
  `character` varchar(255) DEFAULT NULL,
  `jia_user_id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT current_timestamp(6),
  `updated_at` datetime(6) DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `jia_isu_uuid` (`jia_isu_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
