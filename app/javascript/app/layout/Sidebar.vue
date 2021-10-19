<template>
  <div id="sidebarMenu" class="d-md-flex flex-column flex-shrink-0 bg-theme-color text-white sidebar collapse">
    <a href="/" class="d-none d-md-flex align-items-center ms-3 my-3 me-md-auto text-white text-decoration-none">
      <i class="fa fas fa-flask fs-4 me-2"></i> <span class="fs-4 font-xbold spacing-close">Nimble Labs</span>
    </a>

    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a class="nav-link bg-theme-active text-white" aria-current="page" href="#">
          <i data-feather="home" class="text-theme-light small-icon me-3"></i><span class="font-sm">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">
          <i data-feather="file" class="text-theme-light small-icon me-3"></i><span class="font-sm">Orders</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">
          <i data-feather="shopping-cart" class="text-theme-light small-icon me-3"></i><span class="font-sm">Products</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">
          <i data-feather="users" class="text-theme-light small-icon me-3"></i><span class="font-sm">Customers</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">
          <i data-feather="bar-chart-2" class="text-theme-light small-icon me-3"></i><span class="font-sm">Reports</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">
          <i data-feather="layers" class="text-theme-light small-icon me-3"></i><span class="font-sm">Integrations</span>
        </a>
      </li>
    </ul>

    <hr>
    <div class="dropdown ms-3 mb-3">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://avatars.githubusercontent.com/u/1183747" alt="" width="32" height="32" class="rounded-circle me-2">
        <strong>harrisreynolds</strong>
      </a>
      <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
        <li><a class="dropdown-item" href="#">New project...</a></li>
        <li><a class="dropdown-item" href="#">Settings</a></li>
        <li><a class="dropdown-item" href="#">Profile</a></li>
        <li>
          <hr class="dropdown-divider">
        </li>
        <li><a class="dropdown-item" href="#">Sign out</a></li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "Sidebar"
}
</script>

<style scoped>

</style>