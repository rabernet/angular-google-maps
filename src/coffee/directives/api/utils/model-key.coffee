angular.module("google-maps.api.utils")
.factory "ModelKey", ["BaseObject", (BaseObject) ->
    class ModelKey extends BaseObject
        constructor: (@scope) ->
            super()
            @defaultIdKey = "id"
            @idKey = undefined

        evalModelHandle: (model, modelKey) ->
            if model == undefined
                return undefined
            if modelKey == 'self'
                model
            else
                model[modelKey]

        modelKeyComparison: (model1, model2) =>
            scope = if @scope.coords? then @scope else @parentScope
            @evalModelHandle(model1, scope.coords).latitude == @evalModelHandle(model2,
                    scope.coords).latitude and
            @evalModelHandle(model1, scope.coords).longitude == @evalModelHandle(model2,
                    scope.coords).longitude
    ModelKey
]