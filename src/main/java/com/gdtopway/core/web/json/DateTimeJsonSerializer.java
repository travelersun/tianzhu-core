package com.gdtopway.core.web.json;

import java.io.IOException;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.gdtopway.core.util.DateUtils;

public class DateTimeJsonSerializer extends JsonSerializer<Date> {

    @Override
    public void serialize(Date value, JsonGenerator jgen, SerializerProvider provider) throws IOException,
            JsonProcessingException {
        if (value != null) {
            jgen.writeString(DateUtils.formatTime(value));
        }
    }

    public Class<Date> handledType() {
        return Date.class;
    }
}
