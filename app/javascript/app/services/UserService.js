import RailsRestService from "./RailsRestService";

export default class UserService extends RailsRestService {
  constructor() {
    super('/api/v1/', 'users')
  }
}
