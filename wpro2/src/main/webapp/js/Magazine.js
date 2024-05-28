import Book from './Book.js'

class Mazine extends Book{	// import book 해줘야 extends 가능
	constructor(title, author, isbn, issueNumber){ // Book 클래스를 상속받은 Magazine
		super(title, author, isbn);
		this.issueNumber = issueNumber; // 잡지 호수
	}
	
	toString(){
		return `책 제목: ${this.title}, 저자:${this.author}, ISBN:${this.isbn}, 호수:${this.issueNumber}`;
	}
}

export default Mazine;