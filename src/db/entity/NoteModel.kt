package db.entity

import org.jetbrains.exposed.sql.Table

object NoteModel : Table() {
    val id = integer("id").primaryKey().autoIncrement()
    val userEmail = varchar("user_email", 128).index()
    val title = varchar("title", 1024)
    val content = varchar("content", 1024)
    val color = varchar("color", 10)

    /**
     * ref [DrawingModel]
     */
    //val drawingList = varchar("drawingList", 1024)

    /**
     * ref [VoiceModel]
     */
    //val voiceList = varchar("voiceList", 1024)

    /**
     * ref [LabelJoinNoteModel]
     */
    //val labelList = varchar("labelList", 1024)

    //    val replyTo = integer("reply_to").index().nullable()
//    val directReplyTo = integer("direct_reply_to").index().nullable()
    val createdDate = datetime("created_date")
    val modifiedDate = datetime("modified_date")
}

object DrawingModel : Table() {
    val id = integer("id").primaryKey().autoIncrement()
    val noteId = integer("note_id").index()
    val path = varchar("path", 1024)
    val createdDate = datetime("created_date")
    val modifiedDate = datetime("modified_date")
}

object VoiceModel : Table() {
    val id = integer("id").primaryKey().autoIncrement()
    val noteId = integer("note_id").index()
    val path = varchar("path", 1024)
    val createdDate = datetime("created_date")
    val modifiedDate = datetime("modified_date")
}

object LabelJoinNoteModel : Table() {
    val id = integer("id").primaryKey().autoIncrement()
    val labelId = integer("label_id").index()
    val noteId = integer("note_id").index()
    val createdDate = datetime("created_date")
    val modifiedDate = datetime("modified_date")
}

object LabelModel : Table() {
    val id = integer("id").primaryKey().autoIncrement()
    val text = varchar("text", 128)
    val createdDate = datetime("created_date")
    val modifiedDate = datetime("modified_date")
}

object CheckboxModel : Table() {
    val id = integer("id").primaryKey().autoIncrement()
    val text = varchar("text", 128)
    val indent = integer("indent")
    val checked = bool("checked")
    val createdDate = datetime("created_date")
    val modifiedDate = datetime("modified_date")
}