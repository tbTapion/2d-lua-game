--#############################################################
--                  COMPONENT MANAGER
--#############################################################

local ComponentManager = {
    components = {}
}

function ComponentManager:addComponents(entity, components)
    for _, v in pairs(components) do
        if self.components[v.name] == nil then
            self.components[v.name] = {}
        end
        self.components[v.name][entity] = v
    end
end

function ComponentManager:removeAllForEntity(entity)
    for _, v in pairs(self.components) do
        v[entity] = nil
    end
end

function ComponentManager:removeForEntity(entity, componentName)
    self.components[componentName][entity] = nil
end

function ComponentManager:resetAll()
    for k, _ in pairs(self.components) do
        self.components[k] = {}
    end
end

--#############################################################
--                  ENTITY MANAGER
--#############################################################

local EntityManager = {
    entities = {},
    reusable = {},
    nextEntity = 1
}

function EntityManager:newEntity()
    local entity = table.remove(self.reusable)
    if not entity then
        entity = self.nextEntity
        self.nextEntity = self.nextEntity + 1
    end
    table.insert(self.entities, entity)
    return entity
end

function EntityManager:removeEntity(entity)
    local key = 0
    for k, v in pairs(self.entities) do
        if v == entity then
            key = k
        end
    end
    if key > 0 then
        self.entities[key] = nil
        table.insert(self.reusable, key)
    end
end

function EntityManager:reset()
    self.entities = {}
    self.reusable = {}
    self.nextEntity = 1
end

--#############################################################
--                  SYSTEMS MANAGER
--#############################################################

local SystemManager = {
    systems = {}
}

function SystemManager:addSystem(name, system)
    self.systems[name] = system
end

function SystemManager:runSystems(entityManager, componentManager)
    for _, system in pairs(self.systems) do
        --Not using the key
        system(entityManager, componentManager)
    end
end

function SystemManager:removeSystem(name)
    self.systems[name] = nil
end

return {EntityManager, ComponentManager, SystemManager}