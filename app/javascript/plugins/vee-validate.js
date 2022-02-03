import { ValidationProvider, ValidationObserver, extend } from "vee-validate";
import { required, email, max } from "vee-validate/dist/rules";

extend("email_required", {
  ...email,
  message: "有効なメールアドレスではありません。",
});

extend('required', required)
extend('email', email)
extend('max', max)

export default {
  components: {
    ValidationProvider,
    ValidationObserver,
  },
};
