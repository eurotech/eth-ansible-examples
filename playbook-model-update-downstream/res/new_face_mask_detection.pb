node {
  name: "batch_constant"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "z"
      }
    }
  }
}
node {
  name: "ParseExample/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 1
      }
    }
  }
}

node {
  name: "ParseExample/key_y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "ParseExample/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 1
      }
    }
  }
}
node {
  name: "ParseExample/key_z"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "ParseExample/Reshape_2/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 1
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample/names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample/sparse_keys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "sf0"
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample/sparse_keys_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "sf1"
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample/dense_keys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "x"
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample/dense_keys_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "y"
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample/dense_keys_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "z"
      }
    }
  }
}
node {
  name: "ParseExample/ParseExample"
  op: "ParseExample"
  input: "batch_constant"
  input: "ParseExample/ParseExample/names"
  input: "ParseExample/ParseExample/sparse_keys_0"
  input: "ParseExample/ParseExample/sparse_keys_1"
  input: "ParseExample/ParseExample/dense_keys_0"
  input: "ParseExample/ParseExample/dense_keys_1"
  input: "ParseExample/ParseExample/dense_keys_2"
  input: "ParseExample/Reshape/shape"
  input: "ParseExample/Reshape_1/shape"
  input: "ParseExample/Reshape_2/shape"
  attr {
    key: "Nsparse"
    value {
      i: 2
    }
  }
  attr {
    key: "Ndense"
    value {
      i: 3
    }
  }
  attr {
    key: "sparse_types"
    value {
      list {
        type: DT_STRING
        type: DT_STRING
      }
    }
  }
  attr {
    key: "Tdense"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
  attr {
    key: "dense_shapes"
    value {
      list {
        shape {
          dim {
            size: 1
          }
        }
        shape {
          dim {
            size: 1
          }
        }
        shape {
          dim {
            size: 1
          }
        }
      }
    }
  }
}
versions {
  producer: 9
}
