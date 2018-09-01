Namespace TaskList
    Public Class HomeController
        Inherits System.Web.Mvc.Controller

        Private db As New TaskListDataContext()


        ' Displays a list of tasks
        Function Index() As ActionResult
            Dim tasks = From t In db.Tasks Order By t.EntryDate Descending



            Return View(tasks.ToList())
        End Function

        ' Display a form for creating a new task
        Function Create() As ActionResult
            Return View()
        End Function

        ' Adding a new task to the database
        Function CreateNew(Task As String) As ActionResult
            ' Add the new task to the database
            Dim newTask As New Task()
            newTask.Task = Task
            newTask.IsCompleted = False
            newTask.EntryDate = DateTime.Now

            db.Tasks.InsertOnSubmit(newTask)
            db.SubmitChanges()


            Return RedirectToAction("Index")
        End Function

        ' Mark a task as complete
        Function Complete(Id As Integer) As ActionResult
            ' database logic
            Dim tasks = From t In db.Tasks Where t.Id = Id
            For Each Match In tasks
                Match.IsCompleted = True
            Next

            db.SubmitChanges()

            Return RedirectToAction("Index")
        End Function

    End Class
End Namespace