Set of initial nodes and relationships to get started with my UI

START n = node(0)
SET n.type = 'Admin', n.typeId = 1, n.name = 'Root', n.descr = 'Root'
RETURN n;

CREATE (n{name:'Node Type Owner', type:'Admin', typeId:3, descr:'Owns all Node Types'});
CREATE (n{name:'Rel Type Owner', type:'Admin', typeId:3, descr:'Owns all Rel Types'});

CREATE (n{name:'Admin', type:'AdminNodeType', typeId:4, descr:'Admin'});
CREATE (n{name:'AdminNodeType', type:'AdminNodeType', typeId:4, descr:'AdminNodeType'});
CREATE (n{name:'AdminRelType', type:'AdminNodeType', typeId:4, descr:'AdminRelType'});

CREATE (n{name:'Owns', type:'AdminRelType', typeId:5, descr:'Owns'});
CREATE (n{name:'StartNodeType', type:'AdminRelType', typeId:5, descr:'StartNodeType'});
CREATE (n{name:'EndNodeType', type:'AdminRelType', typeId:5, descr:'EndNodeType'});

START n1=node(0), 
n2=node:node_auto_index(name='Rel Type Owner') 
CREATE n1-[:Owns]->n2;

START n1=node(0), 
n2=node:node_auto_index(name='Node Type Owner') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Rel Type Owner'), 
n2=node:node_auto_index(name='Owns') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Rel Type Owner'), 
n2=node:node_auto_index(name='StartNodeType') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Rel Type Owner'), 
n2=node:node_auto_index(name='EndNodeType') 
CREATE n1-[:Owns]->n2;


START n1=node:node_auto_index(name='Node Type Owner'), 
n2=node:node_auto_index(name='Admin') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Node Type Owner'), 
n2=node:node_auto_index(name='AdminNodeType') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Node Type Owner'), 
n2=node:node_auto_index(name='AdminRelType') 
CREATE n1-[:Owns]->n2;

START n1=node(6), 
n2=node:node_auto_index(name='Admin') 
CREATE n1-[:StartNodeType]->n2;

START n1=node(6), 
n2=node:node_auto_index(name='Admin') 
CREATE n1-[:EndNodeType]->n2;

START n1=node(6), 
n2=node:node_auto_index(name='AdminNodeType') 
CREATE n1-[:EndNodeType]->n2;

START n1=node(6), 
n2=node:node_auto_index(name='AdminRelType') 
CREATE n1-[:EndNodeType]->n2;

START n1=node(7), 
n2=node:node_auto_index(name='AdminRelType') 
CREATE n1-[:StartNodeType]->n2;

START n1=node(7), 
n2=node:node_auto_index(name='AdminNodeType') 
CREATE n1-[:EndNodeType]->n2;

START n1=node(8), 
n2=node:node_auto_index(name='AdminRelType') 
CREATE n1-[:StartNodeType]->n2;

START n1=node(8), 
n2=node:node_auto_index(name='AdminNodeType') 
CREATE n1-[:EndNodeType]->n2;

/// end of ADMIN creates

/// start of New Admin Data

CREATE (n{name:'Person', type:'AdminNodeType', typeId:4, descr:'Person'});
CREATE (n{name:'Date', type:'AdminNodeType', typeId:4, descr:'Date'});

START n1=node:node_auto_index(name='Node Type Owner'), 
n2=node:node_auto_index(name='Person') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Node Type Owner'), 
n2=node:node_auto_index(name='Date') 
CREATE n1-[:Owns]->n2;

CREATE (n{name:'Spouse', type:'AdminRelType', typeId:5, descr:'Spouse'});
CREATE (n{name:'DateIn', type:'AdminRelType', typeId:5, descr:'DateIn'});
CREATE (n{name:'Birthdate', type:'AdminRelType', typeId:5, descr:'Birthdate'});

START n1=node:node_auto_index(name='Rel Type Owner'), 
n2=node:node_auto_index(name='Spouse') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Rel Type Owner'), 
n2=node:node_auto_index(name='DateIn') 
CREATE n1-[:Owns]->n2;

START n1=node:node_auto_index(name='Rel Type Owner'), 
n2=node:node_auto_index(name='Birthdate') 
CREATE n1-[:Owns]->n2;

START n1=node(11), 
n2=node:node_auto_index(name='Person') 
CREATE n1-[:StartNodeType]->n2;

START n1=node(11), 
n2=node:node_auto_index(name='Person') 
CREATE n1-[:EndNodeType]->n2;

START n1=node(12), 
n2=node:node_auto_index(name='Date') 
CREATE n1-[:StartNodeType]->n2;

START n1=node(12), 
n2=node:node_auto_index(name='Date') 
CREATE n1-[:EndNodeType]->n2;

START n1=node(13), 
n2=node:node_auto_index(name='Person') 
CREATE n1-[:StartNodeType]->n2;

START n1=node(13), 
n2=node:node_auto_index(name='Date') 
CREATE n1-[:EndNodeType]->n2;

/// end of new Admin Data

/// start of Data

CREATE (n{name:'Fred', type:'Person', typeId:9, descr:'Fred'});
CREATE (n{name:'Mary', type:'Person', typeId:9, descr:'Mary'});

START n1=node:node_auto_index(name='Fred') , 
n2=node:node_auto_index(name='Mary') 
CREATE n1-[:Spouse]->n2;

CREATE (n{name:'1947 Year', type:'Date', typeId:10, descr:'1947 Year'});
CREATE (n{name:'1947-05 Month', type:'Date', typeId:10, descr:'1947-05 Month May'});
CREATE (n{name:'1947-05-01 Day', type:'Date', typeId:10, descr:'1947-05-01 Day'});

START n1=node:node_auto_index(name='1947-05 Month') , 
n2=node:node_auto_index(name='1947 Year') 
CREATE n1-[:DateIn]->n2;

START n1=node:node_auto_index(name='1947-05-01 Day') , 
n2=node:node_auto_index(name='1947-05 Month') 
CREATE n1-[:DateIn]->n2;

START n1=node:node_auto_index(name='Fred') , 
n2=node:node_auto_index(name='1947-05-01 Day')
CREATE n1-[:Birthdate]->n2;