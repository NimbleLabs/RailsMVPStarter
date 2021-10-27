import ContentPane from "../layout/ContentPane";
import UsersList from "./views/users/UsersList";
import UserDetails from "./views/users/UserDetails";

const routes = [
    {
        path: '/admin',
        component: ContentPane,
        redirect: '/admin/users',
        children: [
            {
                path: 'users/:id',
                name: 'user-details',
                component: UserDetails
            },
            {
                path: 'users',
                name: 'users',
                component: UsersList
            }
        ]
    }
]

export default routes