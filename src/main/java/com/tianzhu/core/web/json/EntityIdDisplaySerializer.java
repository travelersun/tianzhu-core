package com.tianzhu.core.web.json;

import java.io.IOException;
import java.io.Serializable;

import org.apache.commons.lang3.ObjectUtils;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.tianzhu.core.entity.PersistableEntity;

/**
 * label-value形式数据解析，一般用于关联对象的列表输出显示
 *
 */
public class EntityIdDisplaySerializer extends JsonSerializer<PersistableEntity<? extends Serializable>> {

    @Override
    public void serialize(PersistableEntity<? extends Serializable> value, JsonGenerator jgen,
            SerializerProvider provider) throws IOException, JsonProcessingException {
        if (value != null) {
            jgen.writeStartObject();
            jgen.writeFieldName("id");
            jgen.writeString(ObjectUtils.toString(value.getId()));
            jgen.writeFieldName("display");
            jgen.writeString(value.getDisplay());
            jgen.writeEndObject();
        }
    }
}
