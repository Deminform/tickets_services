CREATE TABLE "ticket_statuses"(
    "id" BIGINT NOT NULL,
    "status" VARCHAR(50) NOT NULL
);
ALTER TABLE
    "ticket_statuses" ADD PRIMARY KEY("id");
CREATE TABLE "order_statuses"(
    "id" BIGINT NOT NULL,
    "status" VARCHAR(50) NOT NULL
);
ALTER TABLE
    "order_statuses" ADD PRIMARY KEY("id");
CREATE TABLE "roles"(
    "id" INTEGER NOT NULL,
    "role_name" VARCHAR(100) NOT NULL
);
ALTER TABLE
    "roles" ADD PRIMARY KEY("id");
CREATE TABLE "messages"(
    "id" BIGINT NOT NULL,
    "text" TEXT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "created_at" DATE NOT NULL,
    "ticket_id" BIGINT NOT NULL
);
ALTER TABLE
    "messages" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "first_name" VARCHAR(150) NOT NULL,
    "last_name" VARCHAR(150) NOT NULL,
    "email" VARCHAR(150) NOT NULL,
    "role" INTEGER NOT NULL,
    "password" VARCHAR(40) NOT NULL,
    "phone" VARCHAR(15) NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "service_catalog"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "descrition" TEXT NOT NULL,
    "price" FLOAT(53) NOT NULL
);
ALTER TABLE
    "service_catalog" ADD PRIMARY KEY("id");
CREATE TABLE "orders"(
    "id" BIGINT NOT NULL,
    "service_id" INTEGER NOT NULL,
    "created_at" DATE NOT NULL,
    "status" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "manager_id" INTEGER NOT NULL,
    "date" DATE NOT NULL
);
ALTER TABLE
    "orders" ADD PRIMARY KEY("id");
CREATE TABLE "tickets"(
    "id" BIGINT NOT NULL,
    "ticket_status" VARCHAR(50) NOT NULL,
    "description" TEXT NOT NULL,
    "title" VARCHAR(150) NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" DATE NOT NULL,
    "order_id" BIGINT NOT NULL
);
ALTER TABLE
    "tickets" ADD PRIMARY KEY("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_role_foreign" FOREIGN KEY("role") REFERENCES "roles"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_client_id_foreign" FOREIGN KEY("client_id") REFERENCES "users"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_service_id_foreign" FOREIGN KEY("service_id") REFERENCES "service_catalog"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_manager_id_foreign" FOREIGN KEY("manager_id") REFERENCES "users"("id");
ALTER TABLE
    "messages" ADD CONSTRAINT "messages_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "messages" ADD CONSTRAINT "messages_ticket_id_foreign" FOREIGN KEY("ticket_id") REFERENCES "tickets"("id");
ALTER TABLE
    "tickets" ADD CONSTRAINT "tickets_ticket_status_foreign" FOREIGN KEY("ticket_status") REFERENCES "ticket_statuses"("id");
ALTER TABLE
    "tickets" ADD CONSTRAINT "tickets_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "orders"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_status_foreign" FOREIGN KEY("status") REFERENCES "order_statuses"("id");