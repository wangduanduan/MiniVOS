run-db:
	-$(oci) rm -f pgsql
	$(oci) run --name pgsql -d \
    -v $(PG_DATA_DIR):/bitnami/postgresql \
	-e POSTGRESQL_PASSWORD=$(POSTGRESQL_PASSWORD) \
	-p 5432:5432 \
	$(pg_image)

pgsql:
	$(oci) run -it --rm \
    $(pg_image) psql -h $(LOCAL_IP) -U postgres

init-db:
	$(oci) run -it --rm \
	-v $(PWD)/scripts:/usr/local/src \
	-e PGPASSWORD=$(POSTGRESQL_PASSWORD) \
    $(pg_image) psql -h $(LOCAL_IP) -U postgres -f /usr/local/src/create-db.sql

init-table:
	$(oci) run -it --rm \
	-v $(PWD)/scripts:/usr/local/src \
	-e PGPASSWORD=$(POSTGRESQL_PASSWORD) \
    $(pg_image) psql -h $(LOCAL_IP) -U postgres -d $(db_name) -f /usr/local/src/postgres/$(table).sql

