<template>
  <div class="min-h-screen flex items-center justify-center">
    <div
      class="w-2/3 flex min-h-screen max-w-screen-sm items-center justify-center transition-opacity duration-700 ease-in opacity-0 fade-bottom"
      :class="{ 'opacity-100': isAnimated }"
      @mouseenter="isAnimated = true"
    >
      <div class="relative bg-gray-200 bg-opacity-50 rounded-lg p-4 w-full">
        <router-link to="/" class="absolute top-0 right-0 m-4">
          <img
            src="@/assets/images/back.png"
            alt="Back to Home"
            class="h-8 w-8"
          />
          <!-- Adjust size with h-8 w-8 -->
        </router-link>
        <div>
          <h2
            class="mt-8 text-center text-4xl font-extrabold text-slate-700 tracking-tight"
          >
            Create Account
          </h2>
        </div>
        <form class="mt-8 space-y-6" @submit.prevent="signup">
          <input type="hidden" name="remember" value="true" />
          <div class="rounded-md shadow-sm -space-y-px">
            <div>
              <label for="firstName" class="sr-only">First Name</label>
              <input
                id="firstName"
                name="firstName"
                type="text"
                v-model="firstName"
                autocomplete="firstName"
                required
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="First Name"
              />
              <label for="lastName" class="sr-only">Last Name</label>
              <input
                id="lastName"
                name="lastName"
                type="text"
                v-model="lastName"
                autocomplete="lastName"
                required
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Last Name"
              />
              <label for="email" class="sr-only">Email</label>
              <input
                id="email"
                name="email"
                type="email"
                v-model="email"
                autocomplete="email"
                required
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="email"
              />
            </div>
            <div>
              <label for="phoneNumber" class="sr-only"
                >Telephone Number (Format: 7xxxxxxxxx)</label
              >
              <input
                id="phoneNumber"
                name="phoneNumber"
                type="tel"
                pattern="[0-9]{10}"
                v-model="phoneNumber"
                autocomplete="phoneNumber"
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Telephone  Number (Format: 7xxxxxxxxx)"
              />
            </div>
            <div>
              <label for="companySearch" class="sr-only">Company Search</label>
              <input
                id="companySearch"
                name="companySearch"
                type="text"
                v-model="companySearchTerm"
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Search Company"
              />
            </div>
            <div>
              <label for="password" class="sr-only">Password</label>
              <input
                id="password"
                name="password"
                type="password"
                v-model="password"
                autocomplete="current-password"
                required
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Password"
              />
            </div>

            <div>
              <label for="confirmpassword" class="sr-only"
                >Confirm Password</label
              >
              <input
                id="confirmpassword"
                name="confirmpassword"
                type="password"
                v-model="confirmPassword"
                autocomplete="confirmpassword"
                required
                class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Confirm Password"
              />
            </div>
          </div>

          <div
            class="flex flex-col sm:flex-row items-center justify-center space-y-2 sm:space-y-0 sm:space-x-2"
          >
            <button
              type="submit"
              class="w-full sm:w-auto bg-slate-700 hover:bg-green-700 flex-1 justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
              Signup
            </button>
            <router-link
              to="/login"
              class="w-full sm:w-auto bg-slate-700 hover:bg-green-700 inline-flex items-center justify-center flex-1 py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
              Login
            </router-link>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "LoginPage",
  data() {
    return {
      password: "",
      confirmPassword: "",
      firstName: "",
      lastName: "",
      phoneNumber: "",
      companySearchTerm: "",
      isAnimated: false,
    };
  },
  mounted() {
    setTimeout(() => {
      this.isAnimated = true;
    }, 100); // Start the animation shortly after the component mounts
  },
  methods: {
    signup() {
      if (this.password !== this.confirmPassword) {
        alert("Passwords do not match");
        return;
      }
      console.log(process.env.VUE_APP_BACKEND_URL);
      fetch(`${process.env.VUE_APP_BACKEND_URL}/signup`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          firstName: this.firstName,
          lastName: this.lastName,
          email: this.email,
          phoneNumber: this.phoneNumber,
          password: this.password,
        }),
      })
        .then((response) => {
          if (!response.ok) {
            //throw new Error(`HTTP error! status: ${response.status}`);
            return response.json().then((err) => {
              // This will handle JSON response containing the error
              throw new Error(
                `Backend error: ${err.message}\nTrace: ${err.traceback}`,
              );
            });
          } else {
            return response.json(); // Only parse if the response is OK.
          }
        })
        .then((data) => {
          if (data.error) {
            alert(data.error);
          } else if (data.token) {
            console.log("Verification token:", data.token);
            console.log(
              "Data being sent:",
              JSON.stringify({
                firstName: this.firstName,
                lastName: this.lastName,
                email: this.email,
                phoneNumber: this.phoneNumber,
                password: this.password,
              }),
            );
            alert("Signup successful! Redirecting to login...");
            this.$router.push("/login");
          } else {
            alert("An unexpected error occurred.");
          }
        })
        .catch((error) => {
          console.error("Error during the signup:", error);
          if (error instanceof Response && error.status === 500) {
            // If the error is a network response with a 500 status, try to get JSON
            error
              .json()
              .then((err) => {
                alert(
                  `Error during signup: ${
                    err.message || "An unexpected server error occurred."
                  }`,
                );
              })
              .catch((jsonError) => {
                // The response might not be in JSON format, hence the error
                alert(
                  `Error during signup: ${
                    jsonError.statusText || "An unexpected error occurred."
                  }`,
                );
              });
          } else {
            // If the error is not a network error, display its message directly
            alert(`Error during signup: ${error.message}`);
          }
        });
      if (this.companySearchTerm.trim() !== "") {
        // Make request
        fetch(
          `https://api.company-information.service.gov.uk/search/companies?q={this.companySearchTerm}&items_per_page=10&start_index=0`,
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
            },
          },
        )
          .then((data) => {
            // Extract company names from the response
            const companyNames = data.items.map((item) => item.title);
            console.log("Company names:", companyNames);
          })
          .catch((error) => {
            console.error("Error during company search:", error);
            if (error instanceof Response && error.status === 500) {
              // If the error is a network response with a 500 status, try to get JSON
              error
                .json()
                .then((err) => {
                  alert(
                    `Error during company search: ${
                      err.message || "An unexpected server error occurred."
                    }`,
                  );
                })
                .catch((jsonError) => {
                  // The response might not be in JSON format, hence the error
                  alert(
                    `Error during company search: ${
                      jsonError.statusText || "An unexpected error occurred."
                    }`,
                  );
                });
            } else {
              // If the error is not a network error, display its message directly
              alert(`Error during company search: ${error.message}`);
            }
          });
      }
    },
  },
};
</script>
