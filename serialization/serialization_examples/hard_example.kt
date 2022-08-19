import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
data class Child(val name: String)

@Serializable
data class Address(val city: String = "London", val postalCode: String)

@Serializable
data class Person(
    @SerialName("firstName") val name: String,
    @SerialName("lastName") val surname: String,
    val isAlive: Boolean = true,
    val age: Int,
    val address: Address,
    val children: List<Child>,
    val spouse: String?
)

fun main() {
    val employee = Person(
        name = "John",
        surname = "Smith",
        age = 27,
        address = Address(city = "New York", postalCode = "10021-3100"),
        children = listOf(Child("Leah"), Child("Mikey")),
        spouse = null
    )
    val json = Json { prettyPrint = true }
    println(json.encodeToString(employee))
}
