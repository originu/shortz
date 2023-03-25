package com.jaedam.shortz.controller;

import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {

    @Value("${myname}")
    private String myname;

    @GetMapping("/api/sample")
    public ResponseEntity<ObjectNode> getSample() {
        ObjectNode jsonNodes = JsonNodeFactory.instance.objectNode();
        jsonNodes.put("myname", myname);
        return new ResponseEntity<>(jsonNodes, HttpStatus.OK);
    }

}