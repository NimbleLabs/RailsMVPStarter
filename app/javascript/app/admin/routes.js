import ContentPane from "../layout/ContentPane";
import Users from "./views/Users";

const routes = [
    {
        path: '/admin',
        component: ContentPane,
        redirect: '/admin/users',
        children: [
            {
                path: 'users',
                name: 'users',
                component: Users
            }
        ]
    }
]

export default routes