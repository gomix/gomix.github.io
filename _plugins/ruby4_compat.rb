# Compatibility shim for Jekyll 3 / Liquid 4 on Ruby 3.2+
# (taint tracking was removed from Ruby)
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end

    def taint
      self
    end

    def untaint
      self
    end
  end
end
