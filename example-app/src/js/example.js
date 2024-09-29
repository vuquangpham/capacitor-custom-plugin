import { MyCustomPlugin } from 'my-custom-plugin';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    MyCustomPlugin.echo({ value: inputValue })
}
