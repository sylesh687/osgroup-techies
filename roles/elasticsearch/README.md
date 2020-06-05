ElasticSearch
=========

This Roles is used as a provisioner in IaaC with Terraform . This will get Elasticsearch Cluster up and Running 

Requirements
------------

This Role Requires Java Role or Java To be installed .

Role Variables
--------------
  Variables
	1) character : master/data/client
        2) node_class : small/medium/large
        3) es_heap: 32/64

Dependencies
------------
  - Java Role


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT 

Author Information
------------------
Shailesh Thakur (http://osgroup-techies.com).
