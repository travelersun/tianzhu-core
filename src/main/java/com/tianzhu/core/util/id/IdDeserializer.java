package com.tianzhu.core.util.id;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

public class IdDeserializer extends JsonDeserializer<Long> {
	

	@Override  
    public Long deserialize(JsonParser jp, DeserializationContext ctxt)   
      throws IOException, JsonProcessingException {  
        JsonNode node = jp.getCodec().readTree(jp);  
        
        String id = node.get("id").textValue();
                
        return new Long(Long.parseLong(id));
    } 

}
