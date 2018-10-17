-- ----------------------------
-- Table structure for t_datasource_info
-- ----------------------------
CREATE TABLE t_datasource_info (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FNAME varchar(200) NOT NULL COMMENT '数据源名称',
  FDS_TYPE tinyint(2) NOT NULL COMMENT '数据源类型',
  FIP varchar(100) NOT NULL COMMENT 'IP地址',
  FPORT varchar(100) NOT NULL COMMENT '端口号',
  FDBNAME varchar(200) DEFAULT NULL COMMENT '数据库名称/服务名称',
  FCLUSTER_NAME varchar(200) DEFAULT NULL COMMENT '集群名称',
  FURL varchar(500) DEFAULT NULL COMMENT '连接信息',
  FUSERNAME varchar(200) DEFAULT NULL COMMENT '用户名',
  FPASSWORD varchar(200) DEFAULT NULL COMMENT '密码',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FAREA_CODE varchar(12) NOT NULL COMMENT '所在区域编码',
  FDEPT_CODE varchar(12) NOT NULL COMMENT '所属单位编码',
  FCATEGORYID varchar(18) DEFAULT NULL COMMENT '类别id',
  FIS_TARGET tinyint(1) NOT NULL COMMENT '是否是目标表(1是，0不是)',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除)',
  PRIMARY KEY (FID)
)  COMMENT='数据源信息';


-- ----------------------------
-- Table structure for t_datasource_param
-- ----------------------------
CREATE TABLE t_datasource_param (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FDSID varchar(18) NOT NULL COMMENT '数据源ID',
  FNAME varchar(200) NOT NULL COMMENT '参数名称',
  FVALUE varchar(100) NOT NULL COMMENT '参数值',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FNULLABLE tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可空(0.否 1.是)',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;)',
  PRIMARY KEY (FID)
) COMMENT='数据源参数表';


-- ----------------------------
-- Table structure for t_datasource_type
-- ----------------------------
CREATE TABLE t_datasource_type (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;)',
  PRIMARY KEY (FID)
) COMMENT='数据源类型';

-- ----------------------------
-- Table structure for t_dataresource_info
-- ----------------------------
CREATE TABLE t_dataresource_info (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FDSID varchar(18) NOT NULL COMMENT '数据资源ID',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FTITLE varchar(200) NOT NULL COMMENT '标题备注',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FCATEGORYID varchar(18) DEFAULT NULL COMMENT '类别id',
  FIS_TARGET char(1) NOT NULL DEFAULT '0' COMMENT '是否是目标表(1是目标表 0.不是目标表)',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;)',
  PRIMARY KEY (FID)
)  COMMENT='资源表信息';


-- ----------------------------
-- Table structure for t_dataresource_field
-- ----------------------------
CREATE TABLE t_dataresource_field (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FDRID varchar(18) NOT NULL COMMENT '资源表ID',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FTITLE varchar(200) DEFAULT NULL COMMENT '字段备注',
  FCOLUMN_INDEX tinyint(3) NOT NULL COMMENT '列序号',
  FCOLUMN_LENGTH int(5) DEFAULT NULL COMMENT '字段长度',
  FTFDATA_TYPE tinyint(3) NOT NULL COMMENT '数据格式',
  FTFBUS_TYPE varchar(18) DEFAULT NULL COMMENT '业务类型',
  FORIG_DATA_TYPE varchar(50) NOT NULL COMMENT '原始数据类型',
  FFORMAT varchar(100) DEFAULT NULL COMMENT '数据格式',
  FIS_ENABLE char(1) DEFAULT '1' COMMENT '是否使用（1:是 0:否）',
  FIS_ORDERFIELD char(1) DEFAULT '0' COMMENT '是否排序（1:是 0:否）',
  FIS_PKFIELD char(1) DEFAULT '0' COMMENT '是否主键（1:是 0:否）',
  FIS_NOTNULL char(1) DEFAULT '0' COMMENT '是否不可空（1 是 0否）',
  FIS_BIZFIELD char(1) DEFAULT '0' COMMENT '是否业务主键字段（1 是 0否）',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除)',
  PRIMARY KEY (FID)
) COMMENT='资源表字段信息';


-- ----------------------------
-- Table structure for t_dataresource_field_data_type
-- ----------------------------
CREATE TABLE t_dataresource_field_data_type (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除)',
  PRIMARY KEY (FID)
) COMMENT='资源表字段数据类型';


-- ----------------------------
-- Table structure for t_dataresource_field_bus_type
-- ----------------------------
CREATE TABLE t_dataresource_field_bus_type (
  FID varchar(18) NOT NULL COMMENT '关键字',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FIS_SYSTEM char(1) NOT NULL COMMENT '是否系统(1,系统，0,自定义)',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除)',
  PRIMARY KEY (FID)
) COMMENT='资源表字段业务类型';





-- ----------------------------
-- Table structure for t_dic
-- ----------------------------
CREATE TABLE t_dic (
  FCODE varchar(50) NOT NULL COMMENT '字典code, 主键',
  FNAME varchar(200) NOT NULL COMMENT '字典名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '描述',
  FORDER int(5) NOT NULL COMMENT '排序',
  FIS_SYSTEM char(1) NOT NULL COMMENT '是否系统(1,系统，0,自定义)',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FCODE)
) COMMENT='数据字典';


-- ----------------------------
-- Table structure for t_dicitem
-- ----------------------------
CREATE TABLE t_dicitem (
  FID varchar(18) NOT NULL COMMENT '主键',
  FCODE varchar(50) NOT NULL COMMENT '字典code',
  FITEM varchar(100) NOT NULL COMMENT '项',
  FVALUE varchar(300) NOT NULL COMMENT '值',
  FORDER int(5) NOT NULL COMMENT '排序',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
);

-- ----------------------------
-- Table structure for t_filesource_info
-- ----------------------------
CREATE TABLE t_filesource_info (
  FID varchar(32) NOT NULL COMMENT '文件源id',
  FFILENAME varchar(200) NOT NULL COMMENT '文件名称',
  FFILETYPE tinyint(3) NOT NULL COMMENT '文件类型(txt,csv,xlsx,xls.....)',
  FDATASIZE int(32) NOT NULL COMMENT '文件大小',
  FISTITLE tinyint(1) DEFAULT NULL COMMENT '是否有标题(1,有，0.没有)',
  FCSVPATH varchar(200) NOT NULL COMMENT 'csv路径',
  FSEPARATOR varchar(8) NOT NULL COMMENT '分隔符',
  FCHARACTERTYPE varchar(32) DEFAULT NULL COMMENT '字符集类型',
  FDESC varchar(500) DEFAULT NULL COMMENT '说明',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除)',
  PRIMARY KEY (FID)
) COMMENT='文件表信息';

-- ----------------------------
-- Table structure for t_filesource_rule
-- ----------------------------
CREATE TABLE t_filesource_rule (
  FID varchar(32) NOT NULL COMMENT '主键',
  FNAME varchar(200) NOT NULL COMMENT '文件规则名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '文件规则描述',
  FSOURCEID varchar(32) NOT NULL COMMENT '来源ID',
  FTARGETID varchar(32) NOT NULL COMMENT '目标ID',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;2,已禁用)',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='文件规则表';

-- ----------------------------
-- Table structure for t_function
-- ----------------------------
CREATE TABLE t_function (
  FID varchar(18) NOT NULL COMMENT '主键',
  FNAME varchar(200) NOT NULL COMMENT '函数名称',
  FDESC varchar(1500) DEFAULT NULL COMMENT '函数描述',
  FPARAMSIZE int(11) NOT NULL COMMENT '参数个数',
  FIS_SYSTEM char(1) NOT NULL COMMENT '是否系统(1,系统，0,自定义)',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='字段转换函数信息表';

-- ----------------------------
-- Table structure for t_function_param
-- ----------------------------
CREATE TABLE t_function_param (
  FID varchar(18) NOT NULL COMMENT '主键',
  F_FUNCID varchar(18) NOT NULL COMMENT '函数ID',
  FPARAMTYPE varchar(100) NOT NULL COMMENT '参数类型',
  FPARAMORDER int(11) NOT NULL COMMENT '参数序号，从0开始',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='函数参数配置表';


CREATE TABLE t_function_param_limit (
  FID varchar(18) NOT NULL COMMENT '主键',
  FFUNCPARAMID varchar(18) NOT NULL COMMENT '参数ID',
  FPARAMVALUE varchar(300) NOT NULL COMMENT '参数值项',
  FVALUEDESC varchar(300) COMMENT '参数值描述',
  PRIMARY KEY (FID)
) COMMENT='函数参数值项配置表';


-- ----------------------------
-- Table structure for t_rule
-- ----------------------------
CREATE TABLE t_rule (
  FID varchar(18) NOT NULL COMMENT '主键',
  FNAME varchar(200) NOT NULL COMMENT '规则名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '规则描述',
  FSOURCEID varchar(18) NOT NULL COMMENT '来源ID',
  FTARGETID varchar(18) NOT NULL COMMENT '目标ID',
  FSYNCTYPE tinyint(1) NOT NULL COMMENT '同步类型：0，全量，1，增量',
  FSYNCSTRATEGY tinyint(1) NOT NULL DEFAULT '0' COMMENT '同步策略',
  FINCRTYPE tinyint(1) DEFAULT NULL COMMENT '增量类型',
  FINCRCOLUMN varchar(100) DEFAULT NULL COMMENT '增量字段(仅可日期，数值型)',
  FSTEPSIZE bigint(20) DEFAULT NULL COMMENT '步长',
  FINITVAL varchar(100) DEFAULT NULL COMMENT '初始值',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;2,已禁用)',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='规则信息表';


-- ----------------------------
-- Table structure for t_rule_mapping
-- ----------------------------
CREATE TABLE t_rule_mapping (
  FID varchar(18) NOT NULL COMMENT '主键',
  FRULEID varchar(18) NOT NULL COMMENT '规则ID',
  FSOURCEFIELD varchar(100) NOT NULL COMMENT '来源字段',
  FSOURCETYPE varchar(50) NOT NULL COMMENT '来源字段原始类型',
  FSOURCEINDEX int(11) NOT NULL COMMENT '来源字段列序号',
  FTARGETFIELD varchar(100) NOT NULL COMMENT '目标字段',
  FTARGETTYPE varchar(50) NOT NULL COMMENT '目标字段原始类型',
  FTARGETINDEX int(11) NOT NULL COMMENT '目标字段列序号',
  FENABLE char(1) NOT NULL COMMENT '是否启用',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FISNORMALCOL tinyint(1) NOT NULL DEFAULT '1' COMMENT '1，普通列，0，常量列',
  PRIMARY KEY (FID)
) COMMENT='规则映射信息表';


-- ----------------------------
-- Table structure for t_rule_transform
-- ----------------------------
CREATE TABLE t_rule_transform (
  FID varchar(18) NOT NULL COMMENT '主键',
  FRULEID varchar(18) NOT NULL COMMENT '规则ID',
  FMAPPINGID varchar(18) NOT NULL COMMENT 't_rule_mapping的ID',
  FCOLUMNINDEX int(11) NOT NULL COMMENT '来源字段序号',
  FCOLUMNNAME varchar(100) NOT NULL COMMENT '来源字段名称',
  FMETHODID varchar(18) NOT NULL COMMENT '转换函数ID',
  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='规则字段转换配置表';


-- ----------------------------
-- Table structure for t_rule_transfuncparam
-- ----------------------------
CREATE TABLE t_rule_transfuncparam (
  FID varchar(18) NOT NULL COMMENT '主键',
  FRULETRANSFID varchar(18) NOT NULL COMMENT '规则转换ID',
  FMETHODPARAM text DEFAULT NULL COMMENT '参数值',
  FORDER int(2) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (FID)
) COMMENT='规则函数配置表';


-- ----------------------------
-- Table structure for t_task_info
-- ----------------------------
-- CREATE TABLE t_task_info (
--  FID varchar(18) NOT NULL COMMENT '任务id',
--  FNAME varchar(200) NOT NULL COMMENT '任务名称',
--  FDESC varchar(500) NOT NULL COMMENT '任务描述',
--  FSTRATEGY tinyint(1) DEFAULT NULL COMMENT '策略：0，失败时停止后续任务；1，失败时继续后续任务',
--  FSCHEDULEID varchar(18) DEFAULT NULL COMMENT '调度ID',
--  FSTATUS tinyint(1) DEFAULT NULL COMMENT '状态：0，启用；1，禁用',
--  FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
--  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
--  FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
--  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
--  PRIMARY KEY (FID)
-- ) COMMENT='任务表';



-- ----------------------------
-- Table structure for t_task_item
-- ----------------------------
-- CREATE TABLE t_task_item (
--   FID varchar(18) NOT NULL COMMENT '主键',
--   FTID varchar(18) NOT NULL COMMENT '任务ID',
--   FNAME varchar(200) NOT NULL COMMENT '任务项名称',
--  FDESC varchar(500) DEFAULT NULL COMMENT '任务项描述',
--   FDEPEND varchar(200) DEFAULT NULL COMMENT '依赖项',
--   FTYPE tinyint(1) DEFAULT NULL COMMENT '规则类型：0，规则；1，脚本；2，代码',
--   FRULEID varchar(50) NOT NULL COMMENT '规则ID',
--   FSTATUS tinyint(1) NOT NULL COMMENT '状态：0，待运行，1，运行中；2，成功；3，失败',
--   FSUCCESS_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '成功计数',
--   FFAILED_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '失败计数',
--   FCREATER varchar(50) NOT NULL COMMENT '创建者ID',
--   FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
--   FMODIFIER varchar(50) NOT NULL COMMENT '修改者ID',
--   FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
--   PRIMARY KEY (FID)
-- ) COMMENT='任务项表';


-- ----------------------------
-- Table structure for t_task_execution
-- ----------------------------
-- CREATE TABLE t_task_execution (
--   FID varchar(18) NOT NULL COMMENT '主键',
--   FTID varchar(18) NOT NULL COMMENT '任务ID',
--   FTIID varchar(18) NOT NULL COMMENT '任务项ID',
--   FRESULTMSG text COMMENT '结果信息',
--   FSUCCESS_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '成功计数',
--   FFAILED_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '失败计数',
--   PRIMARY KEY (FID)
-- ) COMMENT='任务执行信息表';



-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
-- CREATE TABLE t_schedule (
--   FID varchar(18) NOT NULL COMMENT '调度id',
--   FNAME varchar(150) NOT NULL COMMENT '调度名称',
--   FTASKID varchar(18) NOT NULL COMMENT '任务ID',
--   FCRON varchar(50) NOT NULL COMMENT 'CRON表达式',
--   FDESC varchar(500) DEFAULT NULL COMMENT '调度说明',
--   FSYNC_STATE tinyint(1) NOT NULL COMMENT '最后一次同步状态（0，未同步 1，同步中 2，同步完成 3，同步失败）',
--   FSYNC_TIME datetime DEFAULT NULL COMMENT '最后一次同步时间',
--   FSYNC_FAIL_REASON text DEFAULT NULL COMMENT '最后一次同步失败原因',
--   FCOUNT bigint(32) NOT NULL COMMENT '文件上传数量',
--   FCREATER varchar(50) NOT NULL COMMENT '创建人',
--   FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
--   FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
--   FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
--   FSTATE tinyint(1) NOT NULL COMMENT '状态（0，正常；1，禁用）',
--   PRIMARY KEY (FID)
-- ) COMMENT='调度信息表';


-- ----------------------------
-- Table structure for t_targetlib_es
-- ----------------------------
CREATE TABLE t_targetlib_es (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FDATASOURCEID varchar(18) NOT NULL COMMENT '数据源ID',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;)',
  PRIMARY KEY (FID)
) COMMENT='ES自动建表信息表';


-- ----------------------------
-- Table structure for t_targetlib_es_field
-- ----------------------------
CREATE TABLE t_targetlib_es_field (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FTEID varchar(18) NOT NULL COMMENT 'ElasticSearchTable ID',
  FFIELD varchar(50) NOT NULL COMMENT '列名',
  FTYPE varchar(50) NOT NULL COMMENT '类型',
  FINDEX varchar(50) DEFAULT NULL COMMENT '是否索引 (常用的有：analyzed, not_analyzed)',
  FANALYZER varchar(50) DEFAULT NULL COMMENT '分析器',
  FSEARCH_ANALYZER varchar(50) DEFAULT NULL COMMENT '搜索分析器',
  FNEEDPARTICIPLE char(1) DEFAULT '0' COMMENT '是否需要分词（1:是 0:否）',
  FSTORE char(1) DEFAULT '0' COMMENT '是否单独存储（1:是 0:否）',
  FFORMAT varchar(50) DEFAULT NULL COMMENT '格式化',
  FDOC_VALUES char(1) DEFAULT NULL,
  FNULL_VALUE varchar(50) DEFAULT NULL COMMENT '缺失字段的初始化值',
  FIGNORE_ABOVE int(5) DEFAULT NULL COMMENT '超过多少个字符的文本忽略, 是一个数值',
  FBOOST varchar(50) DEFAULT NULL COMMENT '权重',
  FSIMILARITY varchar(50) DEFAULT 'BM25' COMMENT '相似度算法',
  PRIMARY KEY (FID)
) COMMENT='ES自动建表字段信息表';


-- ----------------------------
-- Table structure for t_targetlib_hbase
-- ----------------------------
CREATE TABLE t_targetlib_hbase (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FDATASOURCEID varchar(18) NOT NULL COMMENT '数据源ID',
  FFAMILY varchar(100) NOT NULL COMMENT '列簇',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;)',
  PRIMARY KEY (FID)
) COMMENT='HBASE自动建表信息表';


-- ----------------------------
-- Table structure for t_targetlib_rdbms
-- ----------------------------
CREATE TABLE t_targetlib_rdbms (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FDATASOURCEID varchar(18) NOT NULL COMMENT '数据源ID',
  FCOMMENT varchar(200) DEFAULT NULL COMMENT '备注',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  FSTATE tinyint(1) NOT NULL COMMENT '记录状态(0,正常;1,已删除;)',
  PRIMARY KEY (FID)
) COMMENT='关系型数据库自动建表信息表';


-- ----------------------------
-- Table structure for t_targetlib_rdbms_field
-- ----------------------------
CREATE TABLE t_targetlib_rdbms_field (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FTRID varchar(18) NOT NULL COMMENT 'targetlib_rdbms ID',
  FNAME varchar(200) NOT NULL COMMENT '名称',
  FCOMMENT varchar(200) DEFAULT NULL COMMENT '备注',
  FFIELDTYPE varchar(50) DEFAULT NULL COMMENT '字段类型',
  FLENGTH int(4) DEFAULT NULL COMMENT '字段长度',
  FNONEMPTY char(1) DEFAULT '0' COMMENT '是否非空（1:是 0:否）',
  FPRIMARYKEY char(1) DEFAULT '0' COMMENT '是否主键（1:是 0:否）',
  PRIMARY KEY (FID)
) COMMENT='关系型数据库自动建表字段信息表';



CREATE TABLE t_operate_log (
  FID varchar(20) NOT NULL COMMENT 'id',
  FIP varchar(255) DEFAULT NULL COMMENT 'ip地址',
  FMETHODNAME varchar(255) DEFAULT NULL COMMENT '方法名称',
  FUSERID varchar(255) DEFAULT NULL COMMENT '用户id',
  FOPERATIONTIME datetime DEFAULT NULL COMMENT '插入时间',
  FOPERATIONPARAMETER varchar(2000) DEFAULT NULL COMMENT '参数',
  FTYPE tinyint(1) NOT NULL COMMENT '日志类型',
  PRIMARY KEY (FID)
) COMMENT='操作日志表';


CREATE TABLE t_category_menu (
  FID varchar(18) NOT NULL COMMENT 'id',
  FPARENTID varchar(18) DEFAULT NULL COMMENT '父id',
  FNAME varchar(32) NOT NULL COMMENT '名称',
  FDESC varchar(200) DEFAULT NULL COMMENT '描述',
  FCREATER varchar(50) NOT NULL COMMENT '创建者id',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改者id',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='资源类别表';




CREATE TABLE t_job_info (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FNAME varchar(200) NOT NULL COMMENT 'JOb名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '备注',
  FSTRATEGY tinyint(1) NOT NULL COMMENT '任务策略:0,失败时停止后续任务;1,失败时继续后续任务',
  FCRON varchar(25) DEFAULT NULL COMMENT '调度频率：CRON表达式',
  FAZKABANSID varchar(50) DEFAULT NULL COMMENT 'azkaban里的调度id',
  FCOUNT bigint(20) DEFAULT NULL COMMENT 'JOB同步总数据量',
  FSYNC_STATE tinyint(1) DEFAULT NULL COMMENT '最后一次同步状态：0，未同步 1，同步中 2，同步完成 3，同步失败,4，等待同步',
  FSYNC_TIME datetime DEFAULT NULL COMMENT '最后一次同步时间',
  FSYNC_FAIL_REASON text COMMENT '最后一次同步失败原因',
  FTAKETIME varchar(50) DEFAULT NULL COMMENT 'JOB总耗时',
  FSTATE tinyint(1) NOT NULL COMMENT '状态（0，正常；1，删除；2，禁用）',
  FCREATER varchar(50) NOT NULL COMMENT '创建人',
  FCREATE_DATE datetime NOT NULL COMMENT '创建时间',
  FMODIFIER varchar(50) NOT NULL COMMENT '修改人',
  FMODIFY_DATE datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (FID)
) COMMENT='Job调度信息';

CREATE TABLE t_task (
  FID varchar(18) NOT NULL COMMENT 'ID',
  FJOBID varchar(18) NOT NULL COMMENT 'JobID',
  FNAME varchar(200) NOT NULL COMMENT '任务名称',
  FDESC varchar(500) DEFAULT NULL COMMENT '备注',
  FDEPEND varchar(300) DEFAULT NULL COMMENT '依赖项',
  FTASKTYPE tinyint(1) NOT NULL COMMENT '任务类型：0，规则；1，脚本；2，代码',
  FRULEID varchar(50) DEFAULT NULL COMMENT '规则ID',
  FSTATE tinyint(1) NOT NULL COMMENT '状态：0，待运行，1，运行中；2，成功；3，失败',
  FSUCCESS_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '成功计数',
  FFAILED_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '失败计数',
  FTAKETIME bigint(20) NOT NULL DEFAULT '0' COMMENT '耗时,毫秒',
  PRIMARY KEY (FID)
) COMMENT='Task任务信息';

CREATE TABLE t_task_exec (
  FID varchar(18) NOT NULL COMMENT '主键',
  FJOBID varchar(18) NOT NULL COMMENT 'JobID',
  FTASKID varchar(18) NOT NULL COMMENT '任务ID',
  FRESULTMSG text COMMENT '结果信息',
  FSUCCESS_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '成功计数',
  FFAILED_COUNT bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '失败计数',
  FTAKETIME bigint(20) NOT NULL DEFAULT '0' COMMENT '耗时,毫秒',
  FINTIME datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (FID)
) COMMENT='Task任务执行信息';

