@Serializable
data class Project(val name: String, val language: String)

fun main() {
    val data = Json.decodeFromString<Project>(
        """{
            "name": "kotlinx.serialization",
            "language": "Kotlin"
        }""")
    println(data)
}