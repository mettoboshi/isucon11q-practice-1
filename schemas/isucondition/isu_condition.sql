CREATE TABLE `isu_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jia_isu_uuid` char(36) NOT NULL,
  `timestamp` datetime NOT NULL,
  `is_sitting` tinyint(1) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`),
  INDEX `idx_jia_isu_uuid` (`jia_isu_uuid`),
  INDEX `idx_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
