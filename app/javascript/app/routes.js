import ContentPane from "./layout/ContentPane";
import Dashboard from "./views/Dashboard";
import Billing from "./views/Billing";

const routes = [
    {
        path: '/app',
        component: ContentPane,
        redirect: '/app/dashboard',
        children: [
            {
                path: 'dashboard',
                name: 'dashboard',
                component: Dashboard
            },
            {
                path: 'billing',
                name: 'billing',
                component: Billing
            }
        ]
    }
]

export default routes