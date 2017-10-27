/***顺序栈的实现***/

#include<iostream>
#include<stdlib.h>
using namespace std;

//顺序栈定义
#define OK 1
#define ERROR 0
#define OVERFLOW -2
#define MAXSIZE  100//顺序栈存储空间的初始分配量
typedef int Status;
typedef char SElemType;


typedef struct StackNode {
	SElemType data;
	struct StackNode *next;//
}StackNode,*LinkStack;

//算法3.1　顺序栈的初始化
Status InitStack(LinkStack &s) {
	s=NULL;
	return OK;
}

//算法3.2　顺序栈的入栈
Status Push(LinkStack &s, SElemType e) {
	StackNode *p;
	p=new StackNode;
	p->data=e;
	p->next=s;
	s=p;
	return OK;
}

//算法3.3　顺序栈的出栈
Status Pop(LinkStack &s, SElemType &t) {
	StackNode *p;
	if(s==NULL)
		return ERROR;
	t=s->data;
	p=s;
	s=s->next;
	delete p;
	return OK;
}

//算法3.4　取顺序栈的栈顶元素
char GetTop(LinkStack s) {//返回S的栈顶元素，不修改栈顶指针
	if(s!=NULL)
		return s->data;
	
}

int main() {
	StackNode *s;
	int choose, flag = 0;
	SElemType j, e, t;
	cout << "1.初始化\n";
	cout << "2.入栈\n";
	cout << "3.依次弹出的栈顶元素\n";
	cout << "4.读栈顶元素\n";
	cout << "0.退出\n\n";

	choose = -1;
	while (choose != 0) {
		cout << "请选择:";
		cin >> choose;
		switch (choose) {
		case 1://算法3.1　顺序栈的初始化
			if (InitStack(s)) {
				flag = 1;
				cout << "成功对栈进行初始化\n\n";
			} else
				cout << "初始化栈失败\n\n";
			break;
		case 2: {//算法3.2　顺序栈的入栈
			if (flag)
			 {
			    cout << "进栈元素依次为(用 ! 结束入栈操作)：\n";
				while (1)
				 {
					cin >> j;
					if(j!='!')
					  Push(s, j);
				    else 
				      break;
				}
				cout << endl << endl;
			}
			 else
				cout << "栈未建立，请重新选择\n\n";
		}
			break;
		case 3://算法3.4　
			cout << "依次弹出的栈顶元素为:\n";
			while (Pop(s, t)){
				flag = -1;
				cout << t << "  ";
			}
			cout << endl << endl;
			break;
		case 4://算法3.3　
			if(flag != -1 && flag != 0)
				cout << "栈顶元素为：\n" << GetTop(s) << endl << endl;
			else
				cout << "栈中无元素，请重新选择\n" << endl;
			break;
		}
	}
	return 0;
}
