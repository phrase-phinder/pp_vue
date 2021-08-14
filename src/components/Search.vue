<template>
    <b-input-group id="search">
    <template #prepend>
      <b-dropdown text="Dropdown" variant="info">
        <b-dropdown-item>Action A</b-dropdown-item>
        <b-dropdown-item>Action B</b-dropdown-item>
      </b-dropdown>
    </template>

    <template #append>
        <b-form-input></b-form-input>
    </template>
  </b-input-group>
</template>

<script>
  export default {
    data() {
      return {
        text: ''
      }
    }
  }
</script>

<style>
    
</style>