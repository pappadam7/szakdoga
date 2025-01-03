def generate_email_content(tickets):
    content = "Köszönjük a foglalását! Az alábbi jegyeket rögzítettük:\n\n"
    for ticket in tickets:
        content += f"- Sor: {ticket.Row}, Szék: {ticket.Seat}\n"
    content += "\nKellemes időtöltést kívánunk!\n\nÜdvözlettel,\nMozi csapata"
    return content
