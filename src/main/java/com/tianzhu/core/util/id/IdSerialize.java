package com.tianzhu.core.util.id;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.tianzhu.core.util.DateUtils;

public class IdSerialize extends JsonSerializer<Long> {
	 
	 @Override  
	    public void serialize(Long value, JsonGenerator jgen, SerializerProvider provider)   
	      throws IOException, JsonProcessingException {  
	        //jgen.writeStartObject();  
	        
	        if (value != null) {
	            jgen.writeString(value.toString());
	        }
	         
	        //jgen.writeEndObject();  
	    }  
	
}
