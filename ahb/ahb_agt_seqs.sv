class ahb_seqs extends uvm_sequence #(write_xtn);  
	
  // Factory registration using `uvm_object_utils

	`uvm_object_utils(ahb_seqs) 

 
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
    extern function new(string name ="ahb_seqs");
endclass

//-----------------  constructor new method  -------------------//
function ahb_seqs::new(string name ="ahb_seqs");
	super.new(name);
endfunction

//------------------------------------------------------------------------------
//
//
//------------------------------------------------------------------------------


//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


class ahb_single_trans extends ahb_seqs;

  	// Factory registration using `uvm_object_utils
	`uvm_object_utils(ahb_single_trans)

	
	//------------------------------------------
	// METHODS
	//------------------------------i------------

	// Standard UVM Methods:
    extern function new(string name ="ahb_single_trans");
    extern task body();
	
endclass
//-----------------  constructor new method  -------------------//
function ahb_single_trans::new(string name = "ahb_single_trans");
	super.new(name);
endfunction

//-----------------  task body method  -------------------//
//Generate 10 transactions of type write_xtn 
//create req instance
//start_item(req)
//assert for randomization
//finish_item(req)

task ahb_single_trans::body();
       
	bit [1:0] size;
	bit write;
	bit [31:0] addr;
	bit [2:0] burst;
        req=write_xtn::type_id::create("req");
	if(req.Hburst == 3'b000)
	begin
        	start_item(req);
        	assert(req.randomize() with {req.Htrans ==2'b10; req.Hwrite==1;});
           		`uvm_info(get_type_name(),$sformatf("printing from single sequence \n %s", req.sprint()),UVM_HIGH)
        	finish_item(req);
	end
	addr = req.Haddr;
	size = req.Hsize;
	burst = req.Hburst;
	write = req.Hwrite;    
endtask



//------------------------------------------------------------------------------
//
//
//------------------------------------------------------------------------------


//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ahb_unspecified from ahb_seq;
/*class ahb_unspecified extends ahb_seqs;

  	
	// Factory registration using `uvm_object_utils
	`uvm_object_utils(ahb_unspecified)

	
	//------------------------------------------
	// METHODS
	//------------------------------i------------

	// Standard UVM Methods:
        extern function new(string name ="ahb_unspecified");
        extern task body();
		
	endclass
//-----------------  constructor new method  -------------------//
function ahb_unspecified::new(string name = "ahb_unspecified");
	super.new(name);
endfunction

	  
//-----------------  task body method  -------------------//
// Generate 10 sequence items with address always equal to 55
// Hint use create req, start item, assert for randomization with in line
//  constraint (with) finish item inside repeat's begin end block 
	
task ahb_unspecified::body();

	bit [1:0] size;
	bit write;
	bit [31:0] addr;
	bit [2:0] burst;
        req=write_xtn::type_id::create("req");
	begin
		
	        start_item(req);
        	assert(req.randomize() with {req.Htrans ==2'b10; req.Hburst inside {0,1};});
           	    `uvm_info(get_type_name(),$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH)
        	finish_item(req);

	addr = req.Haddr;
	size = req.Hsize;
	burst = req.Hburst;
	write = req.Hwrite;    
	
	$display("unspecified started");

	if (req.Hburst == 3'b001)
		begin
		if(req.Hsize == 3'b000)
			begin
			for(int i =0; i<(req.len-1); i++)
				begin
				start_item(req);
				assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+1'b1;});
				addr=req.Haddr;
				finish_item(req);
				end
			end

		if(req.Hsize == 3'b001)       
			begin
			for(int i =0; i<(req.len-1); i++)
				begin
				start_item(req);
				assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+2'd2;});
				addr=req.Haddr;
				finish_item(req);
				end
			end
		if(req.Hsize == 3'b010)
			begin
			for(int i =0; i<(req.len-1); i++)
				begin
				start_item(req);
				assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+3'd4;});
				addr=req.Haddr;
				finish_item(req);
				end
			end
		end
	end
				start_item(req);
				assert(req.randomize() with { Htrans==2'b00;});
				finish_item(req);
endtask


//------------------------------------------------------------------------------
//
//
//------------------------------------------------------------------------------


//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ahb_increment from ahb_seq;
class ahb_increment extends ahb_seqs;

  	
	// Factory registration using `uvm_object_utils
  	`uvm_object_utils(ahb_increment)

	
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
    extern function new(string name ="ahb_increment");
    extern task body();
endclass
//-----------------  constructor new method  -------------------//
function ahb_increment::new(string name = "ahb_increment");
	super.new(name);
endfunction

	  
//-----------------  task body method  -------------------//
// Write the random data on memory address locations consecutively from 0 to 9
// Hint use create req, start item, assert for randomization with in line
//  constraint (with) finish item inside repeat's begin end block    
	
task ahb_increment::body();

	bit [1:0] size;
	bit write;
	bit [31:0] addr;
	bit [2:0] burst;
        req=write_xtn::type_id::create("req");
	begin
		
	        start_item(req);
        	assert(req.randomize() with {req.Htrans ==2'b10; req.Hburst inside {3,5,7};});
           	    `uvm_info(get_type_name(),$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH)
        	finish_item(req);

	addr = req.Haddr;
	size = req.Hsize;
	burst = req.Hburst;
	write = req.Hwrite;    
	
	$display("increment started");

	if(req.Hburst == 3'b011)
		begin
		for(int i =0; i<3; i++)
			begin
				start_item(req);
			   	
				if(req.Hsize == 3'b000)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0001;});
				if(req.Hsize == 3'b001)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0010;});
				if(req.Hsize == 3'b010)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0100;});
				finish_item(req);
				addr=req.Haddr;
			end
		end	
	if(req.Hburst == 3'b101)
		begin
		for(int i =0; i<7; i++)
			begin
				start_item(req);
			   	
				if(req.Hsize == 3'b000)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0001;});
				if(req.Hsize == 3'b001)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0010;});
				if(req.Hsize == 3'b010)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0100;});
				finish_item(req);
				addr=req.Haddr;
			end
		end	
	if(req.Hburst == 3'b111)
		begin
		for(int i =0; i<15; i++)
			begin
				start_item(req);
			   	
				if(req.Hsize == 3'b000)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0001;});
				if(req.Hsize == 3'b001)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0010;});
				if(req.Hsize == 3'b010)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr==addr+4'b0100;});
				finish_item(req);
				addr=req.Haddr;
			end
		end
	end
	
				start_item(req);
				assert(req.randomize() with { Htrans==2'b00;});
				finish_item(req);
endtask
//------------------------------------------------------------------------------
//
//
//------------------------------------------------------------------------------

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ahb_wrapping from ahb_seq;
class ahb_wrapping extends ahb_seqs;

  	
	// Factory registration using `uvm_object_utils
  	`uvm_object_utils(ahb_wrapping)

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
    extern function new(string name ="ahb_wrapping");
    extern task body();
endclass
//-----------------  constructor new method  -------------------//
function ahb_wrapping::new(string name = "ahb_wrapping");
	super.new(name);
endfunction

	  
//-----------------  task body method  -------------------//
// write the 10 random data in odd memory address locations 
// Hint use create req, start item, assert for randomization with in line
// constraint (with) finish item inside repeat's begin end block    

task ahb_wrapping::body();
	
	bit [1:0] size;
	bit write;
	bit [31:0] addr;
	bit [2:0] burst;
        req=write_xtn::type_id::create("req");
	begin
		
	        start_item(req);
        	assert(req.randomize() with {req.Htrans ==2'b10; req.Hburst inside {2,4,6};});
           	    `uvm_info(get_type_name(),$sformatf("printing from wrap sequence \n %s", req.sprint()),UVM_HIGH)
        	finish_item(req);

	addr = req.Haddr;
	size = req.Hsize;
	burst = req.Hburst;
	write = req.Hwrite;    
	
	$display("wrapping started");

	if(req.Hburst == 3'b011)
		begin
		for(int i =0; i<3; i++)
			begin
				start_item(req);
			   	
				if(req.Hsize == 3'b000)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:2],addr[1:0]+1'b1};});
				if(req.Hsize == 3'b001)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:3],addr[2:1]+1'b1,addr[0]};});
				if(req.Hsize == 3'b010)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:4],addr[3:2]+1'b1,addr[1:0]};});
				finish_item(req);
				addr=req.Haddr;
			end
		end	
	if(req.Hburst == 3'b101)
		begin
		for(int i =0; i<7; i++)
			begin
				start_item(req);
			   	
				if(req.Hsize == 3'b000)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:2],addr[1:0]+1'b1};});
				if(req.Hsize == 3'b001)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:3],addr[2:1]+1'b1,addr[0]};});
				if(req.Hsize == 3'b010)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:4],addr[3:2]+1'b1,addr[1:0]};});
				finish_item(req);
				addr=req.Haddr;
			end
		end	
	if(req.Hburst == 3'b111)
		begin
		for(int i =0; i<15; i++)
			begin
				start_item(req);
			   	
				if(req.Hsize == 3'b000)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:2],addr[1:0]+1'b1};});
				if(req.Hsize == 3'b001)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:3],addr[2:1]+1'b1,addr[0]};});
				if(req.Hsize == 3'b010)
					assert(req.randomize() with {Hsize == size; Hburst==burst; Hwrite==write; Htrans==2'b11; Haddr=={addr[31:4],addr[3:2]+1'b1,addr[1:0]};});
				finish_item(req);
				addr=req.Haddr;
			end
		end
	end	
				start_item(req);
				assert(req.randomize() with { Htrans==2'b00;});
				finish_item(req);
endtask */



