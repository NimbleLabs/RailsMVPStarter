import ContentPane from "./layout/ContentPane.vue";
import Dashboard from "./views/Dashboard.vue";
import Billing from "./views/Billing.vue";

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