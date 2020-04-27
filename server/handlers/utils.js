exports.show = function (res, err, data) {
    if (err) {
      res.status(500).send({
        message: 'Ha ocurrido un error inesperado.',
        description: err,
      })
    } else {
      res.send(data)
    }
  }

exports.notFound = (res, message) =>{
    res.status(404).send({
        message: message
    })
}

exports.error = (res, err) => {
    res.status(500).send({
        message: 'Ha ocurrido un error inesperado.',
        description: err
    })
}